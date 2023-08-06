import 'package:adv_weather_app/pages/search_page.dart';
import 'package:adv_weather_app/providers/weather_provider.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: forecastData.isNotEmpty
          ? forecastData[0].getColor()
          : Colors.lightBlue,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Spacer(
                  flex: 6,
                ),
                Text(
                  locationData?.cityName != null
                      ? '${locationData?.cityName}'
                      : '${locationData?.country}',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                Spacer(
                  flex: 3,
                ),
                IconButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage())),
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
            Text(
              forecastData.isNotEmpty
                  ? '${forecastData[0].forecastAvgTemp}° | ${forecastData[0].forecastStateName}'
                  : '',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 140,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: forecastData.isNotEmpty
                    ? forecastData[0].getColor()[300]
                    : Colors.lightBlue[300],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.clock,
                          color: Colors.white,
                          size: 17,
                        ),
                        Text(
                          '  HOURLY FORECAST',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
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
            Container(
              height: 460,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: forecastData.isNotEmpty
                    ? forecastData[0].getColor()[300]
                    : Colors.lightBlue[300],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.calendar,
                          color: Colors.white,
                          size: 17,
                        ),
                        Text(
                          '  10-DAY FORECAST ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: forecastData.length,
                      itemBuilder: (context, index) =>
                          ForecastComponent(forecastModel: forecastData[index]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
