import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/final_test/ans_final_listen_n_complete_words.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/final_test_answers/listen_n_complete_words/listen_n_complete_words_state.dart';

class FinalListenNCompleteWordsBloc
    extends Bloc<CoursesEvent, ListenNCompleteWordsState> {
  final AnsFinalListenNCompleteWordsUseCase useCase;

  FinalListenNCompleteWordsBloc(this.useCase)
    : super(ListenNCompleteWordsInitial()) {
    on<FinalListenNCompleteWordsEvent>((event, emit) async {
      emit(ListenNCompleteWordsLoading());
      try {
        await useCase.call(
          courseId: event.courseId,
          questionId: event.questionId,
          testType: event.testType,
          answerIds: event.answerIds,
        );
        emit(ListenNCompleteWordsLoaded());
      } catch (e) {
        emit(ListenNCompleteWordsError(e.toString()));
      }
    });
  }
}
