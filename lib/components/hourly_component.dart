import 'package:adv_weather_app/models/hourly_model.dart';
import 'package:flutter/material.dart';

class HourlyComponent extends StatelessWidget {
  const HourlyComponent({super.key, required this.hourlyModel});
  final HourlyModel hourlyModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          'https:${hourlyModel.hourlyIcon}',
          height: 50,
          width: 50,
        ),
        Text(
          '${hourlyModel.hourlyTemp.toInt()}°',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
