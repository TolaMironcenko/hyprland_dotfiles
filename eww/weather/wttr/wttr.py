#!/usr/bin/python

import json
import requests
from datetime import datetime

WEATHER_CODES = {
    '113': 'images/113.jpg',
    '116': 'images/116.jpeg',
    '119': 'images/119.jpeg',
    '122': 'images/119.jpeg',
    '143': 'images/143.jpg',
    '176': 'images/176.jpeg',
    '179': 'images/rain.jpeg',
    '182': 'images/rain.jpeg',
    '185': 'images/rain.jpeg',
    '200': 'images/storm.jpeg',
    '227': 'images/snow.jpeg',
    '230': 'images/cold.jpeg',
    '248': 'images/143.jpg',
    '260': 'images/143.jpg',
    '263': 'images/176.jpeg',
    '266': 'images/176.jpeg',
    '281': 'images/rain.jpeg',
    '284': 'images/rain.jpeg',
    '293': 'images/176.jpeg',
    '296': 'images/176.jpeg',
    '299': 'images/rain.jpeg',
    '302': 'images/rain.jpeg',
    '305': 'images/rain.jpeg',
    '308': 'images/rain.jpeg',
    '311': 'images/rain.jpeg',
    '314': 'images/rain.jpeg',
    '317': 'images/rain.jpeg',
    '320': 'images/snow.jpeg',
    '323': 'images/snow.jpeg',
    '326': 'images/snow.jpeg',
    '329': 'images/cold.jpeg',
    '332': 'images/cold.jpeg',
    '335': 'images/cold.jpeg',
    '338': 'images/cold.jpeg',
    '350': 'images/rain.jpeg',
    '353': 'images/176.jpeg',
    '356': 'images/rain.jpeg',
    '359': 'images/rain.jpeg',
    '362': 'images/rain.jpeg',
    '365': 'images/rain.jpeg',
    '368': 'images/snow.jpeg',
    '371': 'images/cold.jpeg',
    '374': 'images/rain.jpeg',
    '377': 'images/rain.jpeg',
    '386': 'images/storm.jpeg',
    '389': 'images/bigstorm.jpeg',
    '392': 'images/storm.jpeg',
    '395': 'images/cold.jpeg'
}

data = {}

weather = requests.get("https://wttr.in/Tomsk+Russia?format=j1").json()

# data['text'] = WEATHER_CODES[weather['current_condition'][0]['weatherCode']] + \
#     " "+weather['current_condition'][0]['FeelsLikeC']+"°"

weather['current_condition'][0]['weatherCode'] = WEATHER_CODES[weather['current_condition'][0]['weatherCode']]

print(json.dumps(weather))
