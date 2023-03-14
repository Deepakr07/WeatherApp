import 'package:flutter/material.dart';
import 'package:weather_app/Services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'd508af4235b5c0a0bf7f8bda8ff8cff2';

class LandingPage extends StatefulWidget {
  //const LandingPage({Key? key}) : super(key: key);
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double? latitude;
  double? longitude;
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    print(location.latitude);
    print(location.longitude);
    getData();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&'
        'lon=$longitude&appid=$apiKey'));
    if (response.statusCode == 200) {
      String data = response.body;
      var temperature = jsonDecode(data)['main']['temp'];
      var description = jsonDecode(data)['weather'][0]['description'];
      var place = jsonDecode(data)['sys']['country'];
      print(place);
      print(description);
      print(temperature);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
      ),
    );
  }
}
