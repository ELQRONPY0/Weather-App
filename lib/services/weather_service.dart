import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  final String apiKey = '12a047efc8544405a22173629240209';

  final String baseUrl = 'https://api.weatherapi.com/v1';

  WeatherService({required this.dio});

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      final Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1',
      );

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'oops! something went wrong';

      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('oops! something went wrong$e');
    }
  }
}
