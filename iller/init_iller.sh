#!/bin/bash

# Elasticsearch adresi
ES_URL="http://192.168.88.7:9200"

# İndeksleri oluşturma
echo "Creating index for illes..."
curl -X PUT "$ES_URL/illes" -H 'Content-Type: application/json' -d '{
  "mappings": {
    "properties": {
      "name": { "type": "text" },
      "population": { "type": "integer" },
      "country": { "type": "text" }
    }
  }
}'
echo -e "\n"

# İndekslerin oluşturulduğunu kontrol etme
echo "Checking if index is created for illes..."
curl -X GET "$ES_URL/illes" -H 'Content-Type: application/json'
echo -e "\n"

# Örnek belgeleri ekleme
echo "Adding documents to illes..."

curl -X POST "$ES_URL/illes/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "Istanbul",
  "population": 15460000,
  "country": "Turkey"
}'
echo -e "\n"
curl -X POST "$ES_URL/illes/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "Ankara",
  "population": 5639076,
  "country": "Turkey"
}'
echo -e "\n"
curl -X POST "$ES_URL/illes/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "Adana",
  "population": 2220125,
  "country": "Turkey"
}'
echo -e "\n"
curl -X POST "$ES_URL/illes/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "Izmir",
  "population": 4320519,
  "country": "Turkey"
}'
echo -e "\n"
curl -X POST "$ES_URL/illes/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "Bursa",
  "population": 3069912,
  "country": "Turkey"
}'
echo -e "\n"
curl -X POST "$ES_URL/illes/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "Antalya",
  "population": 2511700,
  "country": "Turkey"
}'
echo -e "\n"
curl -X POST "$ES_URL/illes/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "Konya",
  "population": 2229437,
  "country": "Turkey"
}'
echo -e "\n"
curl -X POST "$ES_URL/illes/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "Gaziantep",
  "population": 2027680,
  "country": "Turkey"
}'
echo -e "\n"
curl -X POST "$ES_URL/illes/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "Mersin",
  "population": 1778621,
  "country": "Turkey"
}'
echo -e "\n"
curl -X POST "$ES_URL/illes/_doc/" -H 'Content-Type: application/json' -d '{
  "name": "Diyarbakir",
  "population": 1518264,
  "country": "Turkey"
}'
echo -e "\n"

echo "Index and sample documents for illes created successfully."
