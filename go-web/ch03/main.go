package main

import (
    "database/sql"
    "fmt"
    _ "github.com/go-sql-driver/mysql"
    "github.com/gorilla/mux"
    "log"
    "net/http"
)

const (
    DBHost = "127.0.0.1"
    DBPort = ":3306"
    DBUser = "root"
    DBPass = "wsx@zd"
    DBDbase = "cms"
    PORT = ":8080"
)

var database *sql.DB

type Page struct {
    Title string
    Content string
    Date string
}

func ServePage(w http.ResponseWriter, r *http.Request) {
    vars := mux.Vars(r)
    // Get ID from user input
    pageGUID := vars["guid"]
    thisPage := Page{}
    fmt.Println(pageGUID)
    err := database.QueryRow("select page_title,page_content,page_date from pages where page_guid=?", pageGUID).
        Scan(&thisPage.Title, &thisPage.Content, &thisPage.Date)
    if err != nil {
        http.Error(w, http.StatusText(404), http.StatusNotFound)
        log.Println("Couldn't get page!")
    } else {
        html := `<html><head><title>` + thisPage.Title + `</title></head><body><h1>` +
            thisPage.Title + `</h1><div>` +
            thisPage.Content + `</div></body></html>`
        fmt.Fprintln(w, html)
    }
}

func main() {
    dbConn := fmt.Sprintf("%s:%s@/%s", DBUser, DBPass, DBDbase)
    db, err := sql.Open("mysql", dbConn)
    if err != nil {
        log.Println("Couldn't connect to " + DBDbase)
        log.Println(err.Error)
    }
    database = db

    routes := mux.NewRouter()
    routes.HandleFunc("/page/{guid:[0-9a-zA\\-]+}", ServePage)
    http.Handle("/", routes)
    http.ListenAndServe(PORT, nil)
}