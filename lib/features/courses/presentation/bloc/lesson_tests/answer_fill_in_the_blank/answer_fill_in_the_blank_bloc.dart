import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/answer_fill_in_the_blank_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';

import 'answer_fill_in_the_blank_state.dart';

class AnswerFillInTheBlankBloc
    extends Bloc<CoursesEvent, AnswerFillInTheBlankState> {
  final AnswerFillInTheBlankUseCase useCase;

  AnswerFillInTheBlankBloc(this.useCase)
    : super(AnswerFillInTheBlankInitial()) {
    on<AnswerFillInTheBlankEvent>((event, emit) async {
      emit(AnswerFillInTheBlankLoading());
      try {
        await useCase.call(
          courseId: event.courseId,
          lessonId: event.lessonId,
          questionId: event.questionId,
          testType: event.testType,
          answerIds: event.answerIds,
        );
        emit(AnswerFillInTheBlankLoaded());
      } catch (e) {
        emit(AnswerFillInTheBlankError(e.toString()));
      }
    });
  }
}
