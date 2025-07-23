import 'package:skills_xorijdaish/features/courses/domain/entities/get_courses_by_id/course_by_id_entity.dart';

class CourseByIdState {
  CourseByIdState();
}

class CourseByIdInitial extends CourseByIdState {}

class CourseByIdLoading extends CourseByIdState {}

class CourseByIdLoaded extends CourseByIdState {
  final CourseByIdEntity entity;

  CourseByIdLoaded(this.entity);
}

class CourseByIdError extends CourseByIdState {
  final String message;

  CourseByIdError(this.message);
}
