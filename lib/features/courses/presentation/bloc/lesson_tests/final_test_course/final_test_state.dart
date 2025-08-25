import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/lesson_tests_response.dart';

class FinalTestState {
  FinalTestState();
}

class FinalTestInitial extends FinalTestState {}

class FinalTestLoading extends FinalTestState {}

class FinalTestLoaded extends FinalTestState {
  final LessonTestsResponse response;

  FinalTestLoaded(this.response);
}

class FinalTestError extends FinalTestState {
  final String message;

  FinalTestError(this.message);
}
