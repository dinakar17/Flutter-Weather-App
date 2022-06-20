// A screen that gets displayed while we fetch the weather results from openweathermap api
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:climate_app/services/location.dart';
import 'package:climate_app/services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const  LoadingScreen({super.key});
  // _LoadingScreenState createState() => _LoadingScreenState();
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // initState() method is invoked as soon as the class(Stateful Widget) is loaded on the screen
    // and this getLocationData() functions gets invoked
    getLocationData();
  }
  void getLocationData() async {
    // weatherData = {"coord": {"lon": .., "lan": ...}, ...}
    // weatherData contains weather information about our current location
     var weatherData = await WeatherModel().getLocationWeather();
    // A widget that come material.dart module
    // After fetching the weatherData successfully, push LocationScreen onto the Navigation Stack 
    // and pass in weatherData as a prop to the LocationScreen
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
