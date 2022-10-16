package config

import (
	"fmt"
	"log"
	"os"

	"github.com/joho/godotenv"
	"github.com/morelmiles/backend/models"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

var (
	DB  *gorm.DB
	err error
)

func Config() {
	error := godotenv.Load()

	if error != nil {
		log.Println(error)
	}

	username := os.Getenv("DB_USERNAME")
	password := os.Getenv("DB_PASSWORD")
	dbName := os.Getenv("DB_NAME")
	dbHost := os.Getenv("DB_HOST")
	dbPort := os.Getenv("DB_PORT")

	dbLink := fmt.Sprintf("host=%s user=%s dbname=%s port=%s sslmode=disable TimeZone=Africa/Nairobi password=%s",
		dbHost, username, dbName, dbPort, password)
	DB, err = gorm.Open(postgres.Open(dbLink), &gorm.Config{Logger: logger.Default.LogMode(logger.Warn)})

	if err != nil {
		log.Println(err)
	} else {
		fmt.Println("Connected to the database!")
	}

	DB.Debug().AutoMigrate(
		&models.User{},
	)
}
