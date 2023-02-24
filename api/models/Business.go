package models

import (
	"github.com/lib/pq"
	"gorm.io/gorm"
)

type Business struct {
	gorm.Model
	ID          uint64         `gorm:"primary_key;auto_increment" json:"id"`
	Name        string         `gorm:"size:255;not null;" json:"business_name"`
	PhoneNumber string         `gorm:"size:255;not null;" json:"phone"`
	Email       string         `gorm:"size:255;" json:"email"`
	Reviews     uint16         `gorm:"size:255;not null;" json:"business_reviews"`
	Slogan      string         `gorm:"size:255;not null;" json:"slogan"`
	Website     string         `gorm:"size:255;not null;" json:"website"`
	Address     pq.StringArray `gorm:"type:varchar(100)[];not null;" json:"address"`
	Logo        string         `gorm:"size:255;not null;" json:"logo"`
	Approved    bool           `gorm:"type:boolean;default:true;" json:"status"`
	Services    Service        `gorm:"foreignKey:serviceId" json:"services"`
	ServiceId   uint           `json:"serviceid"`
}
