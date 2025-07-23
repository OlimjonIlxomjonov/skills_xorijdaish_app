import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/my_courses_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/my_courses/my_course_state.dart';

class MyCourseBloc extends Bloc<CoursesEvent, MyCourseState> {
  final MyCoursesUseCase useCase;

  MyCourseBloc(this.useCase) : super(MyCourseInitial()) {
    on<MyCoursesEvent>((event, emit) async {
      emit(MyCourseLoading());
      try {
        final response = await useCase.call();
        emit(MyCourseLoaded(response));
      } catch (e) {
        emit(MyCourseError(e.toString()));
      }
    });
  }
}
