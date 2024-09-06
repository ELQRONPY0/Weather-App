class WeatherModel {
  final String cityName;
  final double temp;
  final String lastUpdated;
  final String weatherIcon;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel({
    required this.weatherCondition,
    required this.cityName,
    required this.temp,
    required this.lastUpdated,
    required this.weatherIcon,
    required this.maxTemp,
    required this.minTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      temp: json['current']['temp_c'],
      lastUpdated: json['current']['last_updated'],
      weatherIcon: json['current']['condition']['icon'],
      weatherCondition: json['current']['condition']['text'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
    );
  }
}
