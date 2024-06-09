

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weathers/models/weather.dart';
import 'package:weathers/repositories/api_repository.dart';

class WeatherProvider extends ChangeNotifier{
  Position? position;

  String nameCity = 'Ho Chi Minh' ;

  updatePosition (Position positionCurrent) {
    position = positionCurrent ;
    notifyListeners();

  }

  Future<WeatherData> getWeatherCurren() async {
   WeatherData result =  await ApiRepository.callApiGetWeather(position);
   nameCity = result.name;
   notifyListeners();

   return result ;
  }
   Future<List<WeatherDetail>> getWeatherDetail() async {
   List<WeatherDetail> result =  await ApiRepository.callApiGetWeatherDetail(position);

   return result ;
  }

}