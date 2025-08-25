class RateCourseState {
  RateCourseState();
}

class RateCourseInitial extends RateCourseState {}

class RateCourseLoading extends RateCourseState {}

class RateCourseLoaded extends RateCourseState {}

class RateCourseError extends RateCourseState {
  final String message;

  RateCourseError(this.message);
}
