import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/forecasts_model.dart';

class ForecastComponent extends StatelessWidget {
  const ForecastComponent({super.key, required this.forecastModel});
  final ForecastModel forecastModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 100,
          child: Text(
            '${DateFormat('EEEE').format(forecastModel.forecastDate)}',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        Image.network(
          'https:${forecastModel.forecastIcon}',
          height: 50,
          width: 50,
        ),
        Text(
          '${forecastModel.forecastMinTemp.toInt()}°',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        Container(
          height: 5,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Colors.orange,
                Colors.orange[200]!,
                Colors.orange[100]!,
              ],
            ),
          ),
        ),
        Text(
          '${forecastModel.forecastMaxTemp.toInt()}°',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
