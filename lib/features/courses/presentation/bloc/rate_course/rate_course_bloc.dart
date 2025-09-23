import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/rate_course/rate_coruse_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/rate_course/rate_course_state.dart';

class RateCourseBloc extends Bloc<CoursesEvent, RateCourseState> {
  final RateCourseUseCase useCase;

  RateCourseBloc(this.useCase) : super(RateCourseInitial()) {
    on<RateCourseEvent>((event, emit) async {
      // emit(RateCourseLoading());
      try {
        await useCase.call(
          courseId: event.courseId,
          stars: event.stars,
          comment: event.comment,
        );
        emit(RateCourseLoaded());
      } catch (e) {
        emit(RateCourseError(e.toString()));
      }
    });
  }
}
