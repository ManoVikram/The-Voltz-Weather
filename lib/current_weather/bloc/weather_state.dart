part of './weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherStateInitial extends WeatherState {
  const WeatherStateInitial();
}

class FetchingWeatherInProcess extends WeatherState {
  const FetchingWeatherInProcess();
}

class FetchingWeatherDone extends WeatherState {
  final Weather weather;

  const FetchingWeatherDone({required this.weather});

  @override
  List<Object> get props => [weather];
}

class FetchingWeatherError extends WeatherState {
  const FetchingWeatherError();
}
