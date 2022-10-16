package routes

import (
	"net/http"

	"github.com/gorilla/mux"
	"github.com/morelmiles/backend/controllers"
	"github.com/morelmiles/backend/middleware"
)

func Routes() {
	middleware.InitLogger()

	router := mux.NewRouter().StrictSlash(true)

	// Users
	router.HandleFunc("/api/v1/users", controllers.GetUsers).Methods("GET")
	router.HandleFunc("/api/v1/users/{id}", controllers.GetUserById).Methods("GET")
	router.HandleFunc("/api/v1/users", controllers.CreateUser).Methods("POST")
	router.HandleFunc("/api/v1/users/{id}", controllers.DeleteUserById).Methods("DELETE")
	router.HandleFunc("/api/v1/users/{id}", controllers.UpdateUserById).Methods("PUT")

	http.ListenAndServe(":8080", router)

}
