import 'package:skills_xorijdaish/features/statistics/domain/entity/course/course_time_response.dart';

class CourseTimeState {
  CourseTimeState();
}

class CourseTimeStateInitial extends CourseTimeState {}

class CourseTimeStateLoading extends CourseTimeState {}

class CourseTimeStateLoaded extends CourseTimeState {
  final CourseTimeResponse response;

  CourseTimeStateLoaded(this.response);
}

class CourseTimeStateError extends CourseTimeState {
  final String message;

  CourseTimeStateError(this.message);
}
