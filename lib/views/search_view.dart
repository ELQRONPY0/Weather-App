import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a city',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) async {
                WeatherModel weatherModel = await WeatherService(dio: Dio())
                    .getWeather(cityName: value);
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                hintText: 'Enter a city name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                suffixIcon: Icon(Icons.search),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Search'),
            ),
          ],
        ),
      )),
    );
  }
}
