package main

import (
	"encoding/json"
	"fmt"
	"log"
	"math/rand"
	"net/http"
	"time"
)

type ElasticsearchResponse struct {
	Hits struct {
		Hits []struct {
			Source map[string]interface{} `json:"_source"`
		} `json:"hits"`
	} `json:"hits"`
}

func main() {
	http.HandleFunc("/", hello)
	http.HandleFunc("/staj", randomUlke)
	log.Fatal(http.ListenAndServe(":5555", nil))
}

func hello(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Merhaba Go!")
}

func randomUlke(w http.ResponseWriter, r *http.Request) {
	esURL := "http://192.168.88.7:9200"
	index := "ulkeler"

	resp, err := http.Get(fmt.Sprintf("%s/%s/_search", esURL, index))
	if err != nil {
		http.Error(w, fmt.Sprintf("Error fetching data from Elasticsearch: %v", err), http.StatusInternalServerError)
		return
	}
	defer resp.Body.Close()

	var esResp ElasticsearchResponse
	if err := json.NewDecoder(resp.Body).Decode(&esResp); err != nil {
		http.Error(w, fmt.Sprintf("Error parsing Elasticsearch response: %v", err), http.StatusInternalServerError)
		return
	}

	hits := esResp.Hits.Hits
	if len(hits) == 0 {
		http.Error(w, "No cities found in Elasticsearch index.", http.StatusNotFound)
		return
	}

	rand.Seed(time.Now().UnixNano())
	randomHit := hits[rand.Intn(len(hits))]

	w.Header().Set("Content-Type", "application/json")
	if err := json.NewEncoder(w).Encode(randomHit.Source); err != nil {
		http.Error(w, fmt.Sprintf("Error encoding response: %v", err), http.StatusInternalServerError)
	}
}
