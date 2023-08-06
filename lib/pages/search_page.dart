import 'package:adv_weather_app/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? cityName;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            onChanged: (value) => cityName = value,
            onSubmitted: (value) async {
              cityName = value;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              Provider.of<WeatherProvider>(context, listen: false)
                  .getHourlyData(cityName: cityName);
              Provider.of<WeatherProvider>(context, listen: false)
                  .getForecastData(cityName: cityName);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              border: const OutlineInputBorder(),
              labelText: 'Search now 🔎',
              hintText: 'Search a city 🔎',
              suffixIcon: IconButton(
                onPressed: () {
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .getHourlyData(cityName: cityName);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .getForecastData(cityName: cityName);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
