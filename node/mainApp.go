package main

import (
	"fmt"
	"net/http"
)

func HelloResponse(rw http.ResponseWriter, request *http.Request) {

	fmt.Fprintf(rw, "OK !")
}

func main() {
	http.HandleFunc("/", HelloResponse)
	http.ListenAndServe(":3000", nil)
}
