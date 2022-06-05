import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';

part './location_event.dart';
part './location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository repository;

  LocationBloc({required this.repository})
      : super(const LocationStateInitial()) {
    on<FetchLocation>(fetchLocation);
  }

  Future<void> fetchLocation(
      FetchLocation event, Emitter<LocationState> emit) async {
    emit(const FetchingLocationInProcess());

    try {
      final DeviceLocation location = await repository.fetchLocation();

      emit(FetchingLocationDone(location: location));
    } catch (_) {
      print(_);
      emit(const FetchingLocationError());
    }
  }
}
