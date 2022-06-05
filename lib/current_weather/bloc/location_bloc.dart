import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';

part './location_event.dart';
part './location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(const LocationStateInitial()) {
    on<FetchLocation>((event, emit) {});
  }
}
