from flask import Flask, jsonify
import requests
import random
app= Flask(__name__)

@app.route('/')
def hello():
    return "Merhaba Python"

@app.route('/ulk')
def random_ulke():
    es_url = 'http://192.168.88.7:9200'

    index= "ulkeler"

    try:
        response = requests.get(f'{es_url}/{index}/_search')
        data = response.json()
        hits = data.get('hits',{}).get('hits',[])
        if hits:
            random_ulke = random.choice(hits)['_source']
            return jsonify(random_ulke)
        else:
            return 'No cities found in Elasticsearch index.'
    except Exception as e:
        return f'Error fetching data from Elasticsearch: {str(e)}'

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=6666)