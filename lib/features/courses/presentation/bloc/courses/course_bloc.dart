import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/core/configs/cache/app_session_cache.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/courses_card_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses/course_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';

class CourseBloc extends Bloc<CoursesEvent, CourseState> {
  final CoursesCardUseCase useCase;

  CourseBloc(this.useCase) : super(CourseInitial()) {
    on<getCoursesEvent>((event, emit) async {
      emit(CourseLoading());
      if (appSession.coursesInfo != null) {
        emit(CourseLoaded(appSession.coursesInfo!));
        return;
      }
      try {
        final courses = await useCase.call();
        appSession.coursesInfo = courses;
        emit(CourseLoaded(courses));
      } catch (e) {
        emit(CourseError(e.toString()));
      }
    });
  }
}
