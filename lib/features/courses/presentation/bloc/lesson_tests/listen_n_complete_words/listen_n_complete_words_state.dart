import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_n_complete_words/listen_n_complete_words_entity.dart';

class ListenNCompleteWordsState {
  ListenNCompleteWordsState();
}

class ListenNCompleteWordsInitial extends ListenNCompleteWordsState {}

class ListenNCompleteWordsLoading extends ListenNCompleteWordsState {}

class ListenNCompleteWordsLoaded extends ListenNCompleteWordsState {
  final ListenNCompleteWordsEntity entity;

  ListenNCompleteWordsLoaded(this.entity);
}

class ListenNCompleteWordsError extends ListenNCompleteWordsState {
  final String message;

  ListenNCompleteWordsError(this.message);
}
