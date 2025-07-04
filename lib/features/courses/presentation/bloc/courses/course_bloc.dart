import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/courses_card_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses/course_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';

class CourseBloc extends Bloc<CoursesEvent, CourseState> {
  final CoursesCardUseCase useCase;

  CourseBloc(this.useCase) : super(CourseInitial()) {
    on<getCoursesEvent>((event, emit) async {
      emit(CourseLoading());
      try {
        final courses = await useCase.call();
        emit(CourseLoaded(courses));
      } catch (e) {
        emit(CourseError(e.toString()));
      }
    });
  }
}
