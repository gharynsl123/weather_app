import 'package:flutter/material.dart';
import 'package:weather_app/service/weather_service.dart';
import 'package:weather_app/widget/detail.dart';

class HomePage extends StatefulWidget {
  final weather;

  const HomePage({Key key, this.weather}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic weatherData;

  @override
  void initState() {
    weatherData = widget.weather;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int temperature = weatherData['main']['temp'].toInt();

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  WeatherService().getWeatherbackground(weatherData['weather'][0]['main'].toString())))),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 140.0, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Moday, 23 Nov 2020",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(temperature.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 100)),
                                  Text("°C",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 32)),
                                ],
                              ),
                            ],
                          ),
                          Text(weatherData['weather'][0]['main'],
                              style: TextStyle(color: Colors.white, fontSize: 28))
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(padding: const EdgeInsets.all(20),
                        child: Details(weatherData: weatherData),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 20.0, right: 8.0),
            child: Text(weatherData['name'], textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 26),),
          )
        ],
      ),
    );
  }
}
