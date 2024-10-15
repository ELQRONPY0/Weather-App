import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/utils/weather_utils.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetWeatherCubit(),
        ),
      ],
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          final (primaryColor, secondaryColor) = state is WeatherLoadedState
              ? WeatherUtils.getWeatherColors(
                  state.weatherModel.weatherCondition)
              : (Colors.blue, const Color.fromARGB(255, 156, 186, 230));

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather App',
            theme: ThemeData(
              primaryColor: primaryColor,
              colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
              brightness: Brightness.light,
              appBarTheme: AppBarTheme(
                backgroundColor: primaryColor,
                elevation: 0,
              ),
            ),
            home: const HomeView(),
          );
        },
      ),
    );
  }
}
