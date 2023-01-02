package main

import (
	"backend/config"
	"backend/routes"
)

func main() {
	config.Config()
	routes.Routes()
}
