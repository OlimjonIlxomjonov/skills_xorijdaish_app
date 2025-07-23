import 'package:skills_xorijdaish/features/courses/domain/entities/my_courses/my_courses_response.dart';

class MyCourseState {
  MyCourseState();
}

class MyCourseInitial extends MyCourseState {}

class MyCourseLoading extends MyCourseState {}

class MyCourseLoaded extends MyCourseState {
  final MyCoursesResponse response;

  MyCourseLoaded(this.response);
}

class MyCourseError extends MyCourseState {
  final String message;

  MyCourseError(this.message);
}
