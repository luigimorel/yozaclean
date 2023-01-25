package models

import "gorm.io/gorm"

type Service struct {
	gorm.Model
	ID   uint64 `gorm:"primary_key;auto_increment" json:"id"`
	Name string `gorm:"size:255;not null;" json:"service_name"`
}
