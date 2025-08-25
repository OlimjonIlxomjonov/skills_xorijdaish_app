import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/final_test/fetch_final_test/final_listen_n_complete_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/listen_n_complete_words/fetch_final_listen_n_complete_words_state.dart';

class FetchFinalListenNCompleteWordsBloc
    extends Bloc<CoursesEvent, FetchFinalListenNCompleteWordsState> {
  final FinalTestsRespUseCase useCase;

  FetchFinalListenNCompleteWordsBloc(this.useCase)
    : super(FetchFinalListenNCompleteWordsInitial()) {
    on<FinalTestResponseEvent>((event, emit) async {
      emit(FetchFinalListenNCompleteWordsLoading());
      try {
        final response = await useCase.callListenNCompleteWords(
          courseId: event.courseId,
          questionId: event.questionId,
        );
        emit(FetchFinalListenNCompleteWordsLoaded(response));
      } catch (e) {
        emit(FetchFinalListenNCompleteWordsError(e.toString()));
      }
    });
  }
}
