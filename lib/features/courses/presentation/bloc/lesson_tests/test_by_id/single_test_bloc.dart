import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/test_by_id_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/test_by_id/single_test_state.dart';

class SingleTestBloc extends Bloc<CoursesEvent, SingleTestState> {
  final TestByIdUseCase useCase;

  SingleTestBloc(this.useCase) : super(SingleTestInitial()) {
    on<SingleTestEvent>((event, emit) async {
      emit(SingleTestLoading());
      try {
        final response = await useCase.call(
          courseId: event.courseId,
          lessonId: event.lessonId,
          questionId: event.questionId,
        );
        emit(SingleTestLoaded(response));
      } catch (e) {
        emit(SingleTestError(e.toString()));
      }
    });
  }
}
