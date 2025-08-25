import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_n_complete_words/listen_n_complete_words_entity.dart';

class FetchFinalListenNCompleteWordsState {
  FetchFinalListenNCompleteWordsState();
}

class FetchFinalListenNCompleteWordsInitial
    extends FetchFinalListenNCompleteWordsState {}

class FetchFinalListenNCompleteWordsLoading
    extends FetchFinalListenNCompleteWordsState {}

class FetchFinalListenNCompleteWordsLoaded
    extends FetchFinalListenNCompleteWordsState {
  final ListenNCompleteWordsEntity entity;

  FetchFinalListenNCompleteWordsLoaded(this.entity);
}

class FetchFinalListenNCompleteWordsError
    extends FetchFinalListenNCompleteWordsState {
  final String message;

  FetchFinalListenNCompleteWordsError(this.message);
}
