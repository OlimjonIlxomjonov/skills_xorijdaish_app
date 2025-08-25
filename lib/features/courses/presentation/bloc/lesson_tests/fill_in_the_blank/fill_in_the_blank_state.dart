import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/fill_in_the_blank/fill_in_the_blank_entity.dart';

class FillInTheBlankStat {
  FillInTheBlankStat();
}

class FillInTheBlankInitial extends FillInTheBlankStat {}

class FillInTheBlankLoading extends FillInTheBlankStat {}

class FillInTheBlankLoaded extends FillInTheBlankStat {
  final FillInTheBlankEntity entity;

  FillInTheBlankLoaded(this.entity);
}

class FillInTheBlankError extends FillInTheBlankStat {
  final String message;

  FillInTheBlankError(this.message);
}
