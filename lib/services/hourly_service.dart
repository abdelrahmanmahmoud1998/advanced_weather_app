import 'dart:convert';

import 'package:adv_weather_app/models/hourly_model.dart';
import 'package:http/http.dart' as http;

class HourlyService {
  Future<List<HourlyModel>> getHourly({required cityName}) async {
    List<HourlyModel> hourlyModelList = [];
    try {
      String baseUrl = 'http://api.weatherapi.com/v1';
      String apiKey = 'eec6be357b2c400dbaf232026232007';
      Uri url = Uri.parse(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=10&aqi=no&alerts=no');
      http.Response response = await http.get(url);
      dynamic data = jsonDecode(response.body);
      List<dynamic> dataList = data['forecast']['forecastday'];
      for (int i = 0; i < dataList.length; i++) {
        for (int j = 0; j < dataList[i]['hour'].length; j++) {
          hourlyModelList
              .add(HourlyModel.fromJson(data: dataList[i]['hour'][j]));
        }
      }
    } catch (e) {
      print(e);
    }
    return hourlyModelList;
  }
}
