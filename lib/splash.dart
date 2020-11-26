import 'package:flutter/material.dart';
import 'package:weather_app/homepage.dart';
import 'package:weather_app/service/weather_service.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getDataWeather();
    super.initState();
  }

  void getDataWeather() async {
    var weatherData = await WeatherService().getCityWeather("Bogor");
    print(weatherData);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(weather: weatherData
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("whatsup")),
    );
  }
}
