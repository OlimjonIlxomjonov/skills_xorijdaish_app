class StartCourseState {
  StartCourseState();
}

class StartCourseInitial extends StartCourseState {}

class StartCourseLoading extends StartCourseState {}

class StartCourseLoaded extends StartCourseState {}

class StartCourseError extends StartCourseState {
  final String message;

  StartCourseError(this.message);
}
