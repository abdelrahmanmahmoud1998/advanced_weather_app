import 'dart:convert';

import 'package:adv_weather_app/models/location_model.dart';
import 'package:http/http.dart' as http;

class LocationService {
  LocationModel? locationWeather;
  Future<LocationModel?> getLocation({required cityName}) async {
    try {
      String baseUrl = 'http://api.weatherapi.com/v1';
      String apiKey = 'eec6be357b2c400dbaf232026232007';
      Uri url = Uri.parse(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=10&aqi=no&alerts=no');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data['location']['name'].toString().toLowerCase() ==
          cityName.toString().toLowerCase()) {
        locationWeather = LocationModel.getCity(data: data);
      } else if (data['location']['country'].toString().toLowerCase() ==
          cityName.toString().toLowerCase()) {
        locationWeather = LocationModel.getCountry(data: data);
      }
    } catch (e) {
      print(e);
    }
    return locationWeather;
  }
}
