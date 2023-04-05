import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import '../screens/loading_screen.dart';
import 'networking.dart';

const apikey = '9d9ba333d939b56beec3088ac2b80879';

class WeatherModel {
  Future<dynamic> getcityweather(String city) async {
    networking network = networking(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apikey&units=metric');
    var data = await network.getdata();
    return data;
  }

  Future<dynamic> getlocationweather() async {
    Location location = Location();
    await location.getlocation();
    var latitude = location.latitude;
    var longitude = location.longitude;
    networking network = networking(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey&units=metric');
    var data = await network.getdata();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
