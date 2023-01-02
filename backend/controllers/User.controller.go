package controllers

import (
	"backend/config"
	"backend/helpers"
	"backend/models"
	"encoding/json"
	"fmt"
	"io"
	"net/http"

	"github.com/gorilla/mux"

	"golang.org/x/crypto/bcrypt"
)

// Compares the password before saving it
// This field is supposed to be updated by the OTP after hashing
func ComparePassword(password string, hashedPassword string) error {
	return bcrypt.CompareHashAndPassword([]byte(hashedPassword), []byte(password))
}

// Checks if the user exists
func checkIfUserExists(userId string) bool {
	var user models.User
	config.DB.First(&user, userId)

	return user.ID != 0
}

func GetUsers(w http.ResponseWriter, r *http.Request) {

	var users []models.User
	config.DB.Find(&users)
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(&users)
}

// GetUserById - Fetches a list of all users.
func GetUserById(w http.ResponseWriter, r *http.Request) {
	userId := mux.Vars(r)["id"]

	if !checkIfUserExists(userId) {
		json.NewEncoder(w).Encode("user not found!")
		return
	}

	var user models.User
	config.DB.First(&user, userId)
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(user)
}

// CreateUser - Creates a new user
func CreateUser(w http.ResponseWriter, r *http.Request) {
	body, err := io.ReadAll(r.Body)
	if err != nil {
		helpers.ERROR(w, http.StatusUnprocessableEntity, err)
	}
	user := models.User{}
	err = json.Unmarshal(body, &user)
	if err != nil {
		helpers.ERROR(w, http.StatusUnprocessableEntity, err)
		return
	}

	user.Prepare()
	err = user.BeforeSaveUser()
	if err != nil {
		fmt.Printf("password hashing error: %v", err)
	}

	err = user.BeforeSave(config.DB)
	if err != nil {
		fmt.Println(err)
	}

	err = user.BeforeSavePhone(config.DB)
	if err != nil {
		fmt.Println(err)
	}

	err = user.Validate("")
	if err != nil {
		helpers.ERROR(w, http.StatusUnprocessableEntity, err)
		return
	}

	json.NewDecoder(r.Body).Decode(&user)
	config.DB.Save(&user)
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(user)

}

// UpdateUserById -  Updates a single user by the ID specified
func UpdateUserById(w http.ResponseWriter, r *http.Request) {
	userId := mux.Vars(r)["id"]
	if !checkIfUserExists(userId) {
		w.WriteHeader(http.StatusNotFound)
		json.NewEncoder(w).Encode("user not found!")
		return
	}

	var user models.User

	config.DB.First(&user, userId)
	json.NewDecoder(r.Body).Decode(&user)
	config.DB.Save(&user)
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(user)
}

// DeleteUserById - Updates a single user by the ID specified.
func DeleteUserById(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	userId := mux.Vars(r)["id"]
	if !checkIfUserExists(userId) {
		w.WriteHeader(http.StatusNotFound)
		json.NewEncoder(w).Encode("user not found!")
		return
	}

	var user models.User
	config.DB.Delete(&user, userId)
	json.NewEncoder(w).Encode(user)
}

// Login
// TODO: Handle the OTP codes
func Login(w http.ResponseWriter, r *http.Request) {
	body, err := io.ReadAll(r.Body)
	if err != nil {
		helpers.ERROR(w, http.StatusUnprocessableEntity, err)
		return
	}
	user := models.User{}
	err = json.Unmarshal(body, &user)
	if err != nil {
		helpers.ERROR(w, http.StatusUnprocessableEntity, err)
		return
	}

	user.Prepare()

	err = user.Validate("login")
	if err != nil {
		helpers.ERROR(w, http.StatusUnprocessableEntity, err)
		return
	}

	token, err := SignIn(user.Email, user.Password)
	if err != nil {
		formattedError := helpers.FormatError(err.Error())
		helpers.ERROR(w, http.StatusUnprocessableEntity, formattedError)
		return
	}
	helpers.JSON(w, http.StatusOK, token)

}

// Sign int
func SignIn(phone string, password string) (string, error) {
	var err error

	user := models.User{}
	err = config.DB.Debug().Model(models.User{}).Where("phone=?", password).Take(&user).Error

	if err != nil {
		return " ", err
	}

	// TODO: Check if the OTP stored on the server === OTP entered in APP
	err = models.VerifyPassword(user.Password, password)
	if err != nil && err == bcrypt.ErrMismatchedHashAndPassword {
		return "", err
	}
	return helpers.CreateToken(user.ID)
}
