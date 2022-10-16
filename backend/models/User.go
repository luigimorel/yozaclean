package models

import "gorm.io/gorm"

type User struct {
	gorm.Model
	ID          uint32 `gorm:"primary_key;auto_increment" json:"id"`
	FirstName   string `gorm:"size:255;not null;" json:"first_name"`
	LastName    string `gorm:"size:255;not null;" json:"last_name"`
	Email       string `gorm:"size:100;not null;unique" json:"email"`
	PhoneNumber string `gorm:"size:100;not null;unique" json:"phone_number"`
	District    string `gorm:"size:50;not null;" json:"district"`
	Location    string `gorm:"size:50;not null;" json:"location"`
	Password    string `gorm:"size:100;not null;" json:"password"`
}
