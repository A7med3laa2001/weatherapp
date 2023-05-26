import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/providers/weather_provider.dart';
import 'package:weatherapp/services/weather_services.dart';

class SearchPage extends StatelessWidget {


  String? cityName;

  VoidCallback? updateUi;

  SearchPage({this.updateUi});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            onSubmitted: (data) async{
              cityName = data;
              WeatherService service = WeatherService();
              WeatherModel? weather = await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
              Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              hintText: 'Enter a City',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
              label: Text('Search'),
              contentPadding: EdgeInsets.symmetric(vertical: 32,horizontal: 24)
            ),
          ),
        ),
      ),
    );
  }
}
