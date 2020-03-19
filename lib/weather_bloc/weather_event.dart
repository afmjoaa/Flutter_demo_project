import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetWeather extends WeatherEvent {
  final String cityName;

  const GetWeather(this.cityName);

  @override
  List<Object> get props => [cityName];
}

class GetDetailedWeather extends WeatherEvent {
  final String cityName;

  const GetDetailedWeather(this.cityName);

  @override
  List<Object> get props => [cityName];
}
