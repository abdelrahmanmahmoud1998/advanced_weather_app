import 'dart:convert';

import 'package:adv_weather_app/models/forecasts_model.dart';
import 'package:http/http.dart' as http;

class ForecastService {
  Future<List<ForecastModel>> getForecast({required cityName}) async {
    List<ForecastModel> forecastModelList = [];
    try {
      String baseUrl = 'http://api.weatherapi.com/v1';
      String apiKey = 'eec6be357b2c400dbaf232026232007';
      Uri url = Uri.parse(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=10&aqi=no&alerts=no');
      http.Response response = await http.get(url);
      dynamic data = jsonDecode(response.body);
      dynamic dataList = data['forecast']['forecastday'];
      for (int i = 0; i < dataList.length; i++) {
        forecastModelList.add(ForecastModel.fromJson(data: dataList[i]));
      }
    } catch (e) {
      print(e);
    }
    return forecastModelList;
  }
}
