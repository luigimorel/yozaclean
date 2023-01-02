package controllers

import (
	"backend/helpers"
	"net/http"
)

func Home(w http.ResponseWriter, r *http.Request) {
	helpers.JSON(w, http.StatusOK, "Welcome to the YozaClean API")
}
