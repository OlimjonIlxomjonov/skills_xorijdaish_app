import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_and_complate/listen_n_complate.dart';

class ListenNCompleteState {
  ListenNCompleteState();
}

class ListenNCompleteInitial extends ListenNCompleteState {}

class ListenNCompleteLoading extends ListenNCompleteState {}

class ListenNCompleteLoaded extends ListenNCompleteState {
  final ListenNCompleteEntity entity;

  ListenNCompleteLoaded(this.entity);
}

class ListenNCompleteError extends ListenNCompleteState {
  final String message;

  ListenNCompleteError(this.message);
}
