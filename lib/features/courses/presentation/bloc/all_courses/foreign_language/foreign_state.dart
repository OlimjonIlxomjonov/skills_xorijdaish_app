import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/foreign_language/foreign_language_response.dart';

class ForeignState {
  ForeignState();
}

class ForeignInitial extends ForeignState {}

class ForeignLoading extends ForeignState {}

class ForeignLoaded extends ForeignState {
  final ForeignLanguageResponse response;

  ForeignLoaded(this.response);
}

class ForeignError extends ForeignState {
  final String message;

  ForeignError(this.message);
}
