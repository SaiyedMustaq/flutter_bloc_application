import 'package:equatable/equatable.dart';

import 'Weather.dart';

abstract class WeatherState extends Equatable {
  WeatherState([List props = const []]) : super();
}

class WeatherEmpty extends WeatherState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded({required this.weather}) : super([weather]);

  @override
  List<Object> get props => throw UnimplementedError();
}

class WeatherError extends WeatherState {
  @override
  List<Object> get props => throw UnimplementedError();
}
