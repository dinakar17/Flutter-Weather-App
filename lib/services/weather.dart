import 'location.dart';
import 'networking.dart';

const apiKey = '2a6f1fc62a4db6674182f1e754231d8d';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

// Our custom class
class WeatherModel {
  // getCityWeather is an asynchronous method that returns an JSON object
  Future<dynamic> getCityWeather(String cityName) async {
    // This is the syntax for creating an object instance for a class in dart programming language
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    // weatherData is a JSON object which consists of 'main', 'name' properties etc... (still needs to be updated)
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    // getCurrentLocation returns nothing but requests user's permission to get his/her current location
    // Note that with location object we can tap in the attributes of that Location() class i.e., location.latitude and location.longitude
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    // weatherData = {"coord": {"lon": .., "lan": ...}, "name": "..." }
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
