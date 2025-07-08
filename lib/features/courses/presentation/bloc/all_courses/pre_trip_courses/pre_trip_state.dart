import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/pre_trip_courses/pre_trip_response.dart';

class PreTripState {
  PreTripState();
}

class PreTripInitial extends PreTripState {}

class PreTripLoading extends PreTripState {}

class PreTripLoaded extends PreTripState {
  final PreTripResponse response;

  PreTripLoaded(this.response);
}

class PreTripError extends PreTripState {
  final String message;

  PreTripError(this.message);
}
