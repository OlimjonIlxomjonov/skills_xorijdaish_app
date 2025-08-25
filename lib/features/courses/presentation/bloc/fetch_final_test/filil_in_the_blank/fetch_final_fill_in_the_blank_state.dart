import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/fill_in_the_blank/fill_in_the_blank_entity.dart';

class FetchFinalFillInTheBlankState {
  FetchFinalFillInTheBlankState();
}

class FetchFinalFillInTheBlankInitial extends FetchFinalFillInTheBlankState {}

class FetchFinalFillInTheBlankLoading extends FetchFinalFillInTheBlankState {}

class FetchFinalFillInTheBlankLoaded extends FetchFinalFillInTheBlankState {
  final FillInTheBlankEntity entity;

  FetchFinalFillInTheBlankLoaded(this.entity);
}

class FetchFinalFillInTheBlankError extends FetchFinalFillInTheBlankState {
  final String message;

  FetchFinalFillInTheBlankError(this.message);
}
