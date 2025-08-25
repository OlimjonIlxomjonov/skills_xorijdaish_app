import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/finish_test/finish_test_entity.dart';

class FinishTestState {
  FinishTestState();
}

class FinishTestInitial extends FinishTestState {}

class FinishTestLoading extends FinishTestState {}

class FinishTestLoaded extends FinishTestState {
  final FinishTestEntity entity;

  FinishTestLoaded(this.entity);
}

class FinishTestError extends FinishTestState {
  final String message;

  FinishTestError(this.message);
}
