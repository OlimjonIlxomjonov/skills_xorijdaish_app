import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/finish_test_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/finish_test/finish_test_state.dart';

class FinishTestBloc extends Bloc<CoursesEvent, FinishTestState> {
  final FinishTestUseCase useCase;

  FinishTestBloc(this.useCase) : super(FinishTestInitial()) {
    on<FinishTestEvent>((event, emit) async {
      emit(FinishTestLoading());
      try {
        final entity = await useCase.call(
          courseId: event.courseId,
          lessonId: event.lessonId,
        );
        emit(FinishTestLoaded(entity));
      } catch (e) {
        emit(FinishTestError(e.toString()));
      }
    });
  }
}
