import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/answer_listen_n_complete_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';

import 'answer_listen_complete_state.dart';

class AnswerListenCompleteBloc
    extends Bloc<CoursesEvent, AnswerListenCompleteState> {
  final AnswerListenNCompleteUseCase useCase;

  AnswerListenCompleteBloc(this.useCase)
    : super(AnswerListenCompleteInitial()) {
    on<AnswerListenCompleteEvent>((event, emit) async {
      emit(AnswerListenCompleteLoading());
      try {
        await useCase.call(
          courseId: event.courseId,
          lessonId: event.lessonId,
          questionId: event.questionId,
          testType: event.testType,
          answer: event.answer,
        );
        emit(AnswerListenCompleteLoaded());
      } catch (e) {
        emit(AnswerListenCompleteError(e.toString()));
      }
    });
  }
}
