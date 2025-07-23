import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/start_course.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/start_course/start_course_state.dart';

class StartCourseBloc extends Bloc<CoursesEvent, StartCourseState> {
  final StartCourseUseCase useCase;

  StartCourseBloc(this.useCase) : super(StartCourseInitial()) {
    on<StartCourseEvent>((event, emit) async {
      emit(StartCourseLoading());
      try {
        await useCase.call(courseId: event.courseId);
        emit(StartCourseLoaded());
      } catch (e) {
        emit(StartCourseError(e.toString()));
      }
    });
  }
}
