import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/lesson_tests_response.dart';

class LessonTestState {
  LessonTestState();
}

class LessonTestInitial extends LessonTestState {}

class LessonTestLoading extends LessonTestState {}

class LessonTestLoaded extends LessonTestState {
  final LessonTestsResponse response;

  LessonTestLoaded(this.response);
}

class LessonTestError extends LessonTestState {
  final String message;

  LessonTestError(this.message);
}
