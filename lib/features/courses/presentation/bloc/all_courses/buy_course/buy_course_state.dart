import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/buy_course/buy_course_entity.dart';

class BuyCourseState {
  BuyCourseState();
}

class BuyCourseInitial extends BuyCourseState {}

class BuyCourseLoading extends BuyCourseState {}

class BuyCourseLoaded extends BuyCourseState {
  final BuyCourseEntity entity;

  BuyCourseLoaded(this.entity);
}

class BuyCourseError extends BuyCourseState {
  final String message;

  BuyCourseError(this.message);
}
