package models

import (
	"errors"
	"fmt"
	"html"
	"strings"

	"github.com/badoux/checkmail"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

type User struct {
	ID         uint64 `gorm:"primary_key;auto_increment" json:"id"`
	FirstName  string `gorm:"size:255;not null;" json:"firstName"`
	LastName   string `gorm:"size:255;not null;" json:"lastName"`
	Phone      string `gorm:"type:text;not null;unique" json:"phone"`
	Email      string `gorm:"size:100;unique" json:"email"`
	Password   string `gorm:"size:100;" json:"password"` //Updates with the OTP from Firebase
	Role       string `gorm:"size:50;default:user;" json:"role"`
	Avatar     string `gorm:"size:100;" json:"avatar"`
	NationalID string `gorm:"size:50;" json:"nationalid"`
}

func Hash(password string) ([]byte, error) {
	return bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
}

func VerifyPassword(hashedPassword, password string) error {
	return bcrypt.CompareHashAndPassword([]byte(hashedPassword), []byte(password))
}

func (user *User) BeforeSaveUser() error {
	hashedPassword, err := Hash(user.Password)
	if err != nil {
		return err
	}

	user.Password = string(hashedPassword)
	return nil
}

func (user *User) BeforeSave(db *gorm.DB) error {
	var err error
	// Password handler
	hashedPassword, _ := Hash(user.Password)
	if err != nil {
		return err
	}

	user.Password = string(hashedPassword)

	// Email handler
	var count int64
	err = db.Model(&User{}).Where("email = ?", user.Email).Count(&count).Error
	if err != nil {
		return err
	}

	if count > 0 {
		return fmt.Errorf("email is already in use")
	}
	// Phone handler

	err = db.Model(&User{}).Where("phone = ?", user.Phone).Count(&count).Error

	if err != nil {
		return err
	}
	if count > 0 {
		return fmt.Errorf("phone number is already in use")
	}

	return nil
}

func (user *User) Prepare() {
	user.ID = 0
	user.FirstName = html.EscapeString(strings.TrimSpace(user.FirstName))
	user.LastName = html.EscapeString(strings.TrimSpace(user.LastName))
	user.Email = html.EscapeString(strings.TrimSpace(user.Email))
	user.Phone = html.EscapeString(strings.TrimSpace(user.Phone))
	user.Avatar = html.EscapeString(strings.TrimSpace(user.Avatar))

}

func (user *User) Validate(action string) error {
	switch strings.ToLower(action) {
	case "update":
		if user.FirstName == "" {
			return errors.New("first name is required")
		}
		if user.LastName == "" {
			return errors.New("first name is required")
		}
		if user.Phone == "" {
			return errors.New("phone number is required")
		}
		if user.Password == "" {
			return errors.New("password is required")
		}
		if user.Email == "" {
			return errors.New("email is required")
		}
		if user.NationalID == "" {
			return errors.New("national id details are required")
		}
		if user.Avatar == "" {
			return errors.New("profile photo is required is required")
		}
		if err := checkmail.ValidateFormat(user.Email); err != nil {
			return errors.New("email is invalid")
		}

		return nil

	case "login":
		if user.Password == "" {
			return errors.New("password is required")
		}
		if user.Phone == "" {
			return errors.New("length of phone number is incorrect")
		}

		return nil

	default:
		if user.FirstName == "" {
			return errors.New("first name is required")
		}
		if user.LastName == "" {
			return errors.New("last name is required")
		}
		if user.Phone == "" {
			return errors.New("phone number is required")
		}
		if user.Email == "" {
			return errors.New("email is required")
		}
		if err := checkmail.ValidateFormat(user.Email); err != nil {
			return errors.New("email is invalid")
		}

		return nil
	}
}
