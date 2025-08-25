import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/answer_select_pairs_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/answer_to_select_pairs/answer_select_pairs_state.dart';

class AnswerSelectPairsBloc extends Bloc<CoursesEvent, AnswerSelectPairsState> {
  final AnswerSelectPairsUseCase useCase;

  AnswerSelectPairsBloc(this.useCase) : super(AnswerSelectPairsInitial()) {
    on<AnswerSelectPairsEvent>((event, emit) async {
      emit(AnswerSelectPairsLoading());
      try {
        await useCase.call(
          courseId: event.courseId,
          lessonId: event.lessonId,
          questionId: event.questionId,
          testType: event.testType,
          answerId: event.answerId,
          pairText: event.pairText,
        );
        emit(AnswerSelectPairsLoaded());
      } catch (e) {
        emit(AnswerSelectPairsError(e.toString()));
      }
    });
  }
}
