import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/listen_n_complete_words.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/listen_n_complete_words/listen_n_complete_words_state.dart';

class ListenNCompleteWordsBloc
    extends Bloc<CoursesEvent, ListenNCompleteWordsState> {
  final ListenNCompleteWordsUseCase useCase;

  ListenNCompleteWordsBloc(this.useCase)
    : super(ListenNCompleteWordsInitial()) {
    on<ListenNCompleteWordsEvent>((event, emit) async {
      emit(ListenNCompleteWordsLoading());

      try {
        final entity = await useCase.call(
          courseId: event.courseId,
          lessonId: event.lessonId,
          questionId: event.questionId,
        );
        emit(ListenNCompleteWordsLoaded(entity));
      } catch (e) {
        emit(ListenNCompleteWordsError(e.toString()));
      }
    });
  }
}
