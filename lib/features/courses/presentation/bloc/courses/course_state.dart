import 'package:skills_xorijdaish/features/courses/domain/entities/courses/courses_response.dart';

abstract class CourseState {
  CourseState();
}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseLoaded extends CourseState {
  final CourseStatsResponse response;

  CourseLoaded(this.response);
}

class CourseError extends CourseState {
  final String message;

  CourseError(this.message);
}
