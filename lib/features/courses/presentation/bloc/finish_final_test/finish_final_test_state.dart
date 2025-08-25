import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/finish_final_test/finish_final_test_response.dart';

class FinishFinalTestState {
  FinishFinalTestState();
}

class FinishFinalTestInitial extends FinishFinalTestState {}

class FinishFinalTestLoading extends FinishFinalTestState {}

class FinishFinalTestLoaded extends FinishFinalTestState {
  final FinishFinalTestResponse response;

  FinishFinalTestLoaded(this.response);
}

class FinishFinalTestError extends FinishFinalTestState {
  final String message;

  FinishFinalTestError(this.message);
}
