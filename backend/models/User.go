package models

import (
	"errors"
	"fmt"
	"html"
	"strings"
	"time"

	"github.com/badoux/checkmail"
	"github.com/lib/pq"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

type User struct {
	ID             uint64         `gorm:"primary_key;auto_increment" json:"id"`
	Name           string         `gorm:"size:255;not null;" json:"name"`
	Phone          string         `gorm:"type:text;not null;unique" json:"phone"`
	Email          string         `gorm:"size:100;not null;unique" json:"email"`
	Password       string         `gorm:"size:100;" json:"password"` //Updates with the OTP from Firebase
	Role           string         `gorm:"size:50;default:user;" json:"role"`
	Avatar         string         `gorm:"size:100;" json:"avatar"`
	NationalID     string         `gorm:"size:50;" json:"nationalid"`
	BusinessImages pq.StringArray `gorm:"type:varchar(100)[]" json:"images"`
}

// Look at how to utilize these below for auth
type SignUpInput struct {
	Name     string `json:"name" binding:"required"`
	Email    string `json:"email" binding:"required"`
	Phone    string `gorm:"type:text;not null;unique" json:"phone"`
	Password string `json:"password" binding:"required,min=8"`
}

type UserResponse struct {
	ID        uint32    `json:"id,omitempty"`
	Name      string    `json:"name,omitempty"`
	Email     string    `json:"email,omitempty"`
	Role      string    `json:"role,omitempty"`
	Provider  string    `json:"provider"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
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
	var count int64
	err := db.Model(&User{}).Where("email = ?", user.Email).Count(&count).Error
	if err != nil {
		return err
	}

	if count > 0 {
		return fmt.Errorf("email already exists")
	}

	return nil
}

func (user *User) BeforeSavePhone(db *gorm.DB) error {
	var count int64

	err := db.Model(&User{}).Where("phone = ?", user.Phone).Count(&count).Error

	if err != nil {
		return err
	}
	if count > 0 {
		return fmt.Errorf("phone already exists")
	}
	return nil
}

func (user *User) Prepare() {
	user.ID = 0
	user.Name = html.EscapeString(strings.TrimSpace(user.Name))
	user.Email = html.EscapeString(strings.TrimSpace(user.Email))
	user.Phone = html.EscapeString(strings.TrimSpace(user.Phone))
	user.Avatar = html.EscapeString(strings.TrimSpace(user.Avatar))

}

func (user *User) Validate(action string) error {
	switch strings.ToLower(action) {
	case "update":
		if user.Name == "" {
			return errors.New("name is required")
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
		if user.Name == "" {
			return errors.New("name is required")
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
