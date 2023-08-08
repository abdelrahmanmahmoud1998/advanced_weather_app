import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        SizedBox(
          width: 100.w,
          child: Text(
            DateFormat('EEEE').format(forecastModel.forecastDate),
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
            ),
          ),
        ),
        Image.network(
          'https:${forecastModel.forecastIcon}',
          height: 50.h,
          width: 50.w,
        ),
        Text(
          '${forecastModel.forecastMinTemp.toInt()}°',
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Container(
            height: 5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.orange[200]!,
                  Colors.orange[100]!,
                ],
              ),
            ),
          ),
        ),
        Text(
          '${forecastModel.forecastMaxTemp.toInt()}°',
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
