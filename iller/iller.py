from flask import Flask, jsonify
import requests
import random


app = Flask(__name__)

@app.route('/')
def hello():
    return "Merhaba Python!"

@app.route('/staj')
def random_city():
    # Assuming Elasticsearch is running locally on port 9200
    es_url = 'http://192.168.88.7:9200'
    index = 'illes'
    # Perform a search query to get random document from Elasticsearch index
    try:
        response = requests.get(f'{es_url}/{index}/_search')
        data = response.json()
        hits = data.get('hits', {}).get('hits', [])
        if hits:
            random_city = random.choice(hits)['_source']
            return jsonify(random_city)
        else:
            return 'No cities found in Elasticsearch index.'
    except Exception as e:
        return f'Error fetching data from Elasticsearch: {str(e)}'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=4444)
