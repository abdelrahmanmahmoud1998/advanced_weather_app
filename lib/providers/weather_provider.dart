import 'package:flutter/material.dart';
import '../models/forecasts_model.dart';
import '../models/hourly_model.dart';
import '../models/location_model.dart';
import '../services/forecast_service.dart';
import '../services/hourly_service.dart';
import '../services/location_service.dart';

class WeatherProvider extends ChangeNotifier {
  String? cityName;
  LocationModel? locationWeather;
  List<HourlyModel> hourlyWeather = [];
  List<ForecastModel> forecastWeather = [];
  void getLocationData({required cityName}) async {
    LocationService locationService = LocationService();
    locationWeather = await locationService.getLocation(cityName: cityName);
    notifyListeners();
  }

  void getHourlyData({required cityName}) async {
    HourlyService hourlyService = HourlyService();
    hourlyWeather = await hourlyService.getHourly(cityName: cityName);
    notifyListeners();
  }

  void getForecastData({required cityName}) async {
    ForecastService forecastService = ForecastService();
    forecastWeather = await forecastService.getForecast(cityName: cityName);
    notifyListeners();
  }
}
