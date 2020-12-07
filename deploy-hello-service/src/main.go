package main

import (
"log"
"net/http"
"encoding/json"
"html"
)

type HelloResponse struct {
  Message string `json:"message"`
  Params string `json:"params"`
}

func sayHello(w http.ResponseWriter, r *http.Request){
  keys := r.URL.Query().Encode()
  if keys == "" {
    log.Println("Url has no query params?")
    return
  }

	log.Printf("Escaped: %s", html.EscapeString(keys))
	log.Printf("Not escaped: %s", keys)

  response := &HelloResponse{
    Message: "Welcome and hello!",
    Params: html.EscapeString(keys),
  }
	
	log.Println(response)
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusCreated)
	json.NewEncoder(w).Encode(response)
}

func main() {
  http.HandleFunc("/", sayHello)
  log.Fatal(http.ListenAndServe(":80", nil))
}
