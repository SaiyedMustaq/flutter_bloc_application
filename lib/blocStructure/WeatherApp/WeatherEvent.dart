import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class WeatherEvent extends Equatable {
  WeatherEvent([List props = const []]) : super();
}

class FetchWeather extends WeatherEvent {
  final String city;

  FetchWeather({required this.city})
      : assert(city != null),
        super([city]);

  @override
  List<Object> get props => throw UnimplementedError();
}
