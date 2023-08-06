import 'dart:convert';

import 'package:adv_weather_app/models/location_model.dart';
import 'package:flutter_countries/flutter_countries.dart';
import 'package:http/http.dart' as http;

class LocationService {
  LocationModel? locationWeather;
  List<dynamic> countriesList = [];
  List<dynamic> citiesList = [];
  Future<LocationModel?> getLocation({required cityName}) async {
    String baseUrl = 'http://api.weatherapi.com/v1';
    String apiKey = 'eec6be357b2c400dbaf232026232007';
    Uri url = Uri.parse(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=10&aqi=no&alerts=no');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    countriesList = await Countries.byName(cityName);
    citiesList = await Cities.byName(cityName);
    print(citiesList);
    if (countriesList.contains(cityName)) {
      locationWeather = LocationModel.getCountry(data: data);
    } else if (citiesList.contains(cityName)) {
      locationWeather = LocationModel.getCity(data: data);
    }
    return locationWeather;
  }
}
