import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_by_id/test_by_id_response.dart';

class SingleTestState {
  SingleTestState();
}

class SingleTestInitial extends SingleTestState {}

class SingleTestLoading extends SingleTestState {}

class SingleTestLoaded extends SingleTestState {
  final TestByIdResponse response;

  SingleTestLoaded(this.response);
}

class SingleTestError extends SingleTestState {
  final String message;

  SingleTestError(this.message);
}
