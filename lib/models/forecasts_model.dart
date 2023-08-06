import 'package:flutter/material.dart';

class ForecastModel {
  final DateTime forecastDate;
  final String forecastIcon;
  final String forecastStateName;
  final double forecastMinTemp;
  final double forecastAvgTemp;
  final double forecastMaxTemp;
  ForecastModel({
    required this.forecastDate,
    required this.forecastIcon,
    required this.forecastStateName,
    required this.forecastMinTemp,
    required this.forecastAvgTemp,
    required this.forecastMaxTemp,
  });
  factory ForecastModel.fromJson({required data}) {
    return ForecastModel(
      forecastDate: DateTime.parse(data['date']),
      forecastIcon: data['day']['condition']['icon'],
      forecastStateName: data['day']['condition']['text'],
      forecastMinTemp: data['day']['mintemp_c'],
      forecastAvgTemp: data['day']['avgtemp_c'],
      forecastMaxTemp: data['day']['maxtemp_c'],
    );
  }
  MaterialColor getColor() {
    if (forecastStateName == 'Sunny') {
      return Colors.orange;
    } else if (forecastStateName.contains('Cloudy') ||
        forecastStateName.contains('cloudy')) {
      return Colors.grey;
    } else if (forecastStateName.contains('Rain') ||
        forecastStateName.contains('rain')) {
      return Colors.blue;
    } else
      return Colors.lightBlue;
  }
}
