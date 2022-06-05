part of './location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationStateInitial extends LocationState {
  const LocationStateInitial();
}

class FetchingLocationInProcess extends LocationState {
  const FetchingLocationInProcess();
}

class FetchingLocationDone extends LocationState {
  final DeviceLocation location;

  const FetchingLocationDone({required this.location});

  @override
  List<Object> get props => [location];
}

class FetchingLocationError extends LocationState {
  const FetchingLocationError();
}
