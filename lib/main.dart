import 'package:flutter/material.dart';
import 'widgets/main_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'widgets/pesquisa.dart';





Future<WeatherInfo> fetchWeather() async {
  
  var nomeCidade = "Pinhal de São Bento";
  final apikey = "10f48af80624023e31f11f24d07c37e4"; 
  var requestUrl = "http://api.openweathermap.org/data/2.5/weather?q=${nomeCidade},br&units=metric&appid=${apikey}&lang=pt_br";

  var response = await http.get(Uri.parse(requestUrl));

  if(response.statusCode == 200) {
    return WeatherInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Erro carregando URL");
  }
}

Future<WeatherInfo> pesquisa() async {
  var cidadePesquisa = cCity;
  final apikey = "10f48af80624023e31f11f24d07c37e4"; 
  var requestUrl = "http://api.openweathermap.org/data/2.5/weather?q=${cidadePesquisa},br&units=metric&appid=${apikey}&lang=pt_br";

  var response = await http.get(Uri.parse(requestUrl));

  if(response.statusCode == 200) {
    return WeatherInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Erro carregando URL");
  }
}


class WeatherInfo {
  var location;
  var temp;
  var tempMin;
  var tempMax;
  var weather;
  var humidity;
  var windSpeed;

  WeatherInfo({
    required this.location,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.weather,
    required this.humidity,
    required this.windSpeed
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      location: json['name'],
      temp: json['main']['temp'],
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
      weather: json['weather'][0]['description'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed']
    );
  }
}

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner:false,  
    title: "App de Tempo",
    home: MyApp()
  )
);

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {

  late Future<WeatherInfo>futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  
  
  }

  late Future<WeatherInfo>searchWeather;
  
    pesquisa() {
    setState(() {
      futureWeather = pesquisa();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WeatherInfo>(
        future: futureWeather, 
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MainWidget(
              location: snapshot.data!.location,
              temp: snapshot.data!.temp,
              tempMin: snapshot.data!.tempMin,
              tempMax: snapshot.data!.tempMax,
              weather: snapshot.data!.weather,
              humidity: snapshot.data!.humidity,
              windSpeed: snapshot.data!.windSpeed,
            );
          }else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}")
            );
          }

          return CircularProgressIndicator();
        }
      )

      
    );

  }

  
}


