import 'package:skills_xorijdaish/features/statistics/domain/entity/avrage/average_response.dart';

class AverageState {
  AverageState();
}

class AverageInitial extends AverageState {}

class AverageLoading extends AverageState {}

class AverageLoaded extends AverageState {
  final AverageResponse response;

  AverageLoaded(this.response);
}

class AverageError extends AverageState {
  final String message;

  AverageError(this.message);
}
