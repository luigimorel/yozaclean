package models

import "github.com/lib/pq"

type Business struct {
	ID             uint64         `gorm:"primary_key;auto_increment" json:"id"`
	Name           string         `gorm:"size:255;not null;" json:"business_name"`
	Reviews        uint16         `gorm:"size:255;not null;" json:"business_reviews"`
	Location       pq.StringArray `gorm:"type:varchar(100)[];not null;" json:"business_location"`
	BusinessImages pq.StringArray `gorm:"type:varchar(100)[]" json:"business_images"`
	Status         bool           `gorm:"type:boolean;default:true;" json:"status"`
	Services       pq.StringArray `gorm:"type:varchar(100)[];not null;" json:"services"`
}
