#!/bin/bash

# Elasticsearch adresi
ES_URL="http://192.168.88.7:9200"

# İndeksleri oluşturma
echo "Creating index for ulkeler..."
curl -X PUT "$ES_URL/ulkeler" -H 'Content-Type: application/json' -d '{
  "mappings": {
    "properties": {
      "name": { "type": "text" },
      "capital": { "type": "text" },
      "population": { "type": "integer" },
      "continent": { "type": "text" }
    }
  }
}'
echo -e "\n"

# İndekslerin oluşturulduğunu kontrol etme
echo "Checking if index is created for ulkeler..."
curl -X GET "$ES_URL/ulkeler" -H 'Content-Type: application/json'
echo -e "\n"

# Örnek belgeleri ekleme
echo "Adding documents to ulkeler..."

curl -X POST "$ES_URL/ulkeler/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "Turkey",
  "capital": "Ankara",
  "population": 83429615,
  "continent": "Asia"
}'
echo -e "\n"
curl -X POST "$ES_URL/ulkeler/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "Germany",
  "capital": "Berlin",
  "population": 83166711,
  "continent": "Europe"
}'
echo -e "\n"
curl -X POST "$ES_URL/ulkeler/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "United States",
  "capital": "Washington, D.C.",
  "population": 331449281,
  "continent": "North America"
}'
echo -e "\n"
curl -X POST "$ES_URL/ulkeler/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "China",
  "capital": "Beijing",
  "population": 1444216107,
  "continent": "Asia"
}'
echo -e "\n"
curl -X POST "$ES_URL/ulkeler/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "India",
  "capital": "New Delhi",
  "population": 1393409038,
  "continent": "Asia"
}'
echo -e "\n"
curl -X POST "$ES_URL/ulkeler/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "Brazil",
  "capital": "Brasilia",
  "population": 213993437,
  "continent": "South America"
}'
echo -e "\n"
curl -X POST "$ES_URL/ulkeler/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "Russia",
  "capital": "Moscow",
  "population": 145912025,
  "continent": "Europe"
}'
echo -e "\n"
curl -X POST "$ES_URL/ulkeler/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "Japan",
  "capital": "Tokyo",
  "population": 126050804,
  "continent": "Asia"
}'
echo -e "\n"
curl -X POST "$ES_URL/ulkeler/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "Mexico",
  "capital": "Mexico City",
  "population": 130262216,
  "continent": "North America"
}'
echo -e "\n"
curl -X POST "$ES_URL/ulkeler/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "Indonesia",
  "capital": "Jakarta",
  "population": 276361783,
  "continent": "Asia"
}'
echo -e "\n"

echo "Index and sample documents for ulkeler created successfully."
