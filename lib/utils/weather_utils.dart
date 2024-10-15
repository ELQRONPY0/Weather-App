import 'package:flutter/material.dart';

class WeatherUtils {
  static (Color, Color) getWeatherColors(String condition) {
    condition = condition.toLowerCase();
    if (condition.contains('sunny') || condition.contains('clear')) {
      return (Colors.orange, Colors.yellow);
    } else if (condition.contains('cloudy') || condition.contains('overcast')) {
      return (Colors.blueGrey, Colors.grey);
    } else if (condition.contains('rain') || condition.contains('drizzle')) {
      return (Colors.indigo, Colors.blue);
    } else if (condition.contains('snow') || condition.contains('sleet')) {
      return (Colors.lightBlue, Colors.white);
    } else if (condition.contains('thunder') || condition.contains('storm')) {
      return (Colors.deepPurple, Colors.purple);
    } else {
      return (Colors.blue, const Color.fromARGB(255, 156, 186, 230));
    }
  }
}
