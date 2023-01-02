package config

import (
	"backend/models"
	"fmt"
	"log"
	"os"

	"github.com/joho/godotenv"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var (
	DB *gorm.DB
)

func Config() {
	err := godotenv.Load(".env")

	if err != nil {
		log.Fatal("Error loading .env file")
	}

	username := os.Getenv("DB_USERNAME")
	password := os.Getenv("DB_PASSWORD")
	dbName := os.Getenv("DB_NAME")
	dbHost := os.Getenv("DB_HOST")
	dbPort := os.Getenv("DB_PORT")

	dbLink := fmt.Sprintf("host=%s user=%s dbname=%s port=%s sslmode=disable TimeZone=Africa/Nairobi password=%s",
		dbHost, username, dbName, dbPort, password)
	DB, err = gorm.Open(postgres.Open(dbLink), &gorm.Config{})

	if err != nil {
		panic(err)
	}

	fmt.Println("Connected to the database!")

	DB.Debug().AutoMigrate(
		&models.User{},
	)

}
