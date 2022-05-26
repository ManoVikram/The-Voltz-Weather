import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';

part './weather_event.dart';
part './weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;

  WeatherBloc({required this.repository}) : super(const WeatherStateInitial()) {
    on<FetchWeather>(fetchWeather);
  }

  Future<void> fetchWeather(
      FetchWeather event, Emitter<WeatherState> emit) async {
    emit(const FetchingWeatherInProcess());

    try {
      final Weather weather = await repository.fetchWeather();

      emit(FetchingWeatherDone(weather: weather));
    } catch (_) {
      print(_);
      emit(const FetchingWeatherError());
    }
  }
}
