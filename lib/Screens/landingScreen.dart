import 'package:flutter/material.dart';
import 'package:weather_app/Services/location.dart';
import '../Services/networking.dart';

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
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&'
        'lon=$longitude&appid=$apiKey');
    print(location.latitude);
    print(location.longitude);
    var weatherData = networkHelper.getData();
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
