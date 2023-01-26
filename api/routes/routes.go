package routes

import (
	"backend/controllers"
	"backend/helpers"
	"net/http"
	"os"

	"github.com/gorilla/mux"

	"github.com/rs/cors"
	httpSwagger "github.com/swaggo/http-swagger"
)

func Routes() {

	port := os.Getenv("PORT")

	helpers.InitLogger()

	router := mux.NewRouter().StrictSlash(true)
	corsHandler := cors.Default().Handler(router)

	// Swggers
	router.PathPrefix("/api/v1/swagger/").Handler(httpSwagger.WrapHandler)

	// Home
	router.HandleFunc("/", helpers.SetMiddlewareJSON(controllers.Home)).Methods("GET")

	// Auth
	// TODO: Enable auth again
	router.HandleFunc("/api/v1/login", controllers.Login).Methods("POST")

	// Users
	router.HandleFunc("/api/v1/users", controllers.GetUsers).Methods("GET")
	router.HandleFunc("/api/v1/users/{id}", helpers.SetMiddlewareJSON(controllers.GetUserById)).Methods("GET")
	router.HandleFunc("/api/v1/register", helpers.SetMiddlewareJSON(controllers.CreateUser)).Methods("POST")
	router.HandleFunc("/api/v1/users/{id}", controllers.DeleteUserById).Methods("DELETE")
	router.HandleFunc("/api/v1/users/{id}", controllers.UpdateUserById).Methods("PATCH")

	// Server port
	http.ListenAndServe(":"+port, corsHandler)
}
