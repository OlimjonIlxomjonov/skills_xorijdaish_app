import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/answer_to_test.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/answer_to_test/answer_state.dart';

class AnswerBloc extends Bloc<CoursesEvent, AnswerState> {
  final AnswerToTestUseCase useCase;

  AnswerBloc(this.useCase) : super(AnswerInitial()) {
    on<AnswerEvent>((event, emit) async {
      emit(AnswerLoading());
      try {
        await useCase.call(
          courseId: event.courseId,
          lessonId: event.lessonId,
          questionId: event.questionId,
          testType: event.testType,
          answerId: event.answerId,
        );
        emit(AnswerLoaded());
      } catch (e) {
        emit(AnswerError(e.toString()));
      }
    });
  }
}
