import 'package:adv_weather_app/models/hourly_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HourlyComponent extends StatelessWidget {
  const HourlyComponent({super.key, required this.hourlyModel});
  final HourlyModel hourlyModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          'https:${hourlyModel.hourlyIcon}',
          height: 50.h,
          width: 50.w,
        ),
        Text(
          '${hourlyModel.hourlyTemp.toInt()}°',
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
