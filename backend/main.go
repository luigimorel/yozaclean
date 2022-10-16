package main

import (
	"github.com/morelmiles/backend/config"
	"github.com/morelmiles/backend/routes"
)

func main() {
	config.Config()
	routes.Routes()
}
