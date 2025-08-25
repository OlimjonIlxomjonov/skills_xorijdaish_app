import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/final_test_course_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/final_test_course/final_test_state.dart';

class FinalTestBloc extends Bloc<CoursesEvent, FinalTestState> {
  final FinalTestCourseUseCase useCase;

  FinalTestBloc(this.useCase) : super(FinalTestInitial()) {
    on<FinalTestCourseEvent>((event, emit) async {
      emit(FinalTestLoading());
      try {
        final response = await useCase.call(courseId: event.courseId);
        emit(FinalTestLoaded(response));
      } catch (e) {
        emit(FinalTestError(e.toString()));
      }
    });
  }
}
