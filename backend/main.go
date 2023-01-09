package main

import (
	"backend/config"
	"backend/routes"
)

func main() {
	config.Config()
	// config.FirebaseConfig()
	routes.Routes()
}
