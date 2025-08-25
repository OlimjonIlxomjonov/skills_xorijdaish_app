import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_and_complate/listen_n_complate.dart';

class FetchFinalListenNCompleteState {
  FetchFinalListenNCompleteState();
}

class FinalListenNCompleteInitial extends FetchFinalListenNCompleteState {}

class FinalListenNCompleteLoading extends FetchFinalListenNCompleteState {}

class FinalListenNCompleteLoaded extends FetchFinalListenNCompleteState {
  final ListenNCompleteEntity entity;

  FinalListenNCompleteLoaded(this.entity);
}

class FinalListenNCompleteError extends FetchFinalListenNCompleteState {
  final String message;

  FinalListenNCompleteError(this.message);
}
