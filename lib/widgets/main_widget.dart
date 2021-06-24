import 'package:flutter/material.dart';
import 'tempo.dart';
import 'pesquisa.dart';

class MainWidget extends StatelessWidget {
  final location;
  final temp;
  final tempMin;
  final tempMax;
  final weather;
  final humidity;
  final windSpeed;

  MainWidget({
    required this.location,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.weather,
    required this.humidity,
    required this.windSpeed
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      
        children: [
          MyCustomForm(),
            
          Container(
            height: MediaQuery.of(context).size.height * 0.47,
            width: MediaQuery.of(context).size.width,
            color: Colors.yellow.shade800,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${location.toString()}",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom:10.0),
                  child: Text(
                    "${temp.toInt().toString()}°",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900
                    ),
                  )
                ),
                Text(
                  "Máx de ${tempMax.toInt().toString()}°, min de ${tempMin.toInt().toString()}°",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w900
                  )
                ),
                
              ],
            ),
          ),
          Expanded(
                  
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  WeatherTile(icon: Icons.thermostat_outlined, title: "Temperatura", subtitle: "${temp.toInt().toString()}°"),
                  WeatherTile(icon: Icons.filter_drama, title: "Tempo", subtitle: "${weather.toString()}"),
                  WeatherTile(icon: Icons.opacity_rounded, title: "Umidade", subtitle: "${humidity.toString()}"),
                  WeatherTile(icon: Icons.waves_outlined, title: "Veloc. vento", subtitle: "${windSpeed.toInt().toString()}"),
                ],
              )
            )
          )
        ],
      );
  }
}
