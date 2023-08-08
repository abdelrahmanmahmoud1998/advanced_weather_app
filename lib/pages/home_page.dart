import 'package:adv_weather_app/pages/search_page.dart';
import 'package:adv_weather_app/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../components/forecast_component.dart';
import '../components/hourly_component.dart';
import '../models/forecasts_model.dart';
import '../models/hourly_model.dart';
import '../models/location_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    LocationModel? locationData =
        Provider.of<WeatherProvider>(context).locationWeather;
    List<HourlyModel> hourlyData =
        Provider.of<WeatherProvider>(context).hourlyWeather;
    List<ForecastModel> forecastData =
        Provider.of<WeatherProvider>(context).forecastWeather;
    return hourlyData.isNotEmpty && forecastData.isNotEmpty
        ? Scaffold(
            backgroundColor: forecastData.isNotEmpty
                ? forecastData[0].getColor()
                : Colors.lightBlue,
            body: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(
                        flex: 6,
                      ),
                      Text(
                        locationData?.cityName != null
                            ? '${locationData?.cityName}'
                            : '${locationData?.country}',
                        style: TextStyle(
                          fontSize: 30.sp,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchPage())),
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    forecastData.isNotEmpty
                        ? '${forecastData[0].forecastAvgTemp}° | ${forecastData[0].forecastStateName}'
                        : '',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: REdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    height: 140.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: forecastData.isNotEmpty
                          ? forecastData[0].getColor()[300]
                          : Colors.lightBlue[300],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: REdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.clock,
                                color: Colors.white,
                                size: 17.sp,
                              ),
                              Text(
                                '  HOURLY FORECAST',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.white,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: hourlyData.length,
                            itemBuilder: (context, index) =>
                                HourlyComponent(hourlyModel: hourlyData[index]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: REdgeInsets.symmetric(horizontal: 20),
                      width: 350.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: forecastData.isNotEmpty
                            ? forecastData[0].getColor()[300]
                            : Colors.lightBlue[300],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding: REdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.calendar,
                                    color: Colors.white,
                                    size: 17.sp,
                                  ),
                                  Text(
                                    '  10-DAY FORECAST ',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                              color: Colors.white,
                              indent: 10,
                              endIndent: 10,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: forecastData.length,
                                itemBuilder: (context, index) =>
                                    ForecastComponent(
                                        forecastModel: forecastData[index]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color(0xff115BB4),
              actions: [
                IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchPage())),
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            backgroundColor: const Color(0xff228CE4),
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff115BB4),
                    Color(0xff115BB4),
                    Color(0xff115BB4),
                    Color(0xff115BB4),
                    Color(0xff2E9AE5),
                    Color(0xff2E9AE5),
                    Color(0xff2E9AE5),
                    Color(0xff2E9AE5),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 4,
                    ),
                    SizedBox(
                      height: 200.h,
                      width: 200.w,
                      child: Image.network(
                        'https://static.wikia.nocookie.net/ipod/images/d/d6/Weather_iOS_15.png/revision/latest?cb=20220611140027',
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      'There is no weather 😢 Start',
                      style: TextStyle(fontSize: 24.sp, color: Colors.white),
                    ),
                    Text(
                      'searching now 🔎',
                      style: TextStyle(fontSize: 24.sp, color: Colors.white),
                    ),
                    const Spacer(
                      flex: 6,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
