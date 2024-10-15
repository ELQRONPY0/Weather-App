import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utils/constants.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});

  // جلب بيانات الطقس لمدينة معينة
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      final Response response = await dio.get(
        '${Constants.baseUrl}/forecast.json?key=${Constants.apiKey}&q=$cityName&days=1',
      );

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      // معالجة أخطاء الشبكة بشكل أفضل
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('اتصال الشبكة منتهي المهلة');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('انتهت مهلة استلام البيانات');
      } else {
        final String errorMessage =
            e.response?.data['error']['message'] ?? 'حدث خطأ غير متوقع';
        throw Exception(errorMessage);
      }
    } catch (e) {
      throw Exception('حدث خطأ غير متوقع: $e');
    }
  }
}
