import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_by_id/test_by_id_response.dart';

class FinalTestByIdState {
  FinalTestByIdState();
}

class FinalTestByIdInitial extends FinalTestByIdState {}

class FinalTestByIdLoading extends FinalTestByIdState {}

class FinalTestByIdLoaded extends FinalTestByIdState {
  final TestByIdResponse response;

  FinalTestByIdLoaded(this.response);
}

class FinalTestByIdError extends FinalTestByIdState {
  final String message;

  FinalTestByIdError(this.message);
}
