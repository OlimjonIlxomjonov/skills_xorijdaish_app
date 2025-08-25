import 'package:skills_xorijdaish/features/courses/domain/entities/lessons/lessons_by_id/lessons_by_id_entity.dart';

class LessonsByIdState {
  LessonsByIdState();
}

class LessonsByIdInitial extends LessonsByIdState {}

class LessonsByIdLoading extends LessonsByIdState {}

class LessonsByIdLoaded extends LessonsByIdState {
  final LessonsByIdEntity entity;

  LessonsByIdLoaded(this.entity);
}

class LessonsByIdError extends LessonsByIdState {
  final String message;

  LessonsByIdError(this.message);
}
