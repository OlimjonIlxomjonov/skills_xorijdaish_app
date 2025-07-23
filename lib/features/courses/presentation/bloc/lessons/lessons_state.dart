import 'package:skills_xorijdaish/features/courses/domain/entities/lessons/lessons_response.dart';

class LessonsState {
  LessonsState();
}

class LessonsInitial extends LessonsState {}

class LessonsLoading extends LessonsState {}

class LessonsLoaded extends LessonsState {
  final LessonsResponse response;

  LessonsLoaded(this.response);
}

class LessonsError extends LessonsState {
  final String message;

  LessonsError(this.message);
}
