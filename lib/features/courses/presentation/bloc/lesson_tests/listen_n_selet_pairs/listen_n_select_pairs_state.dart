import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_n_select_pairs/listen_n_select_pairs_entity.dart';

class ListenNSelectPairsState {
  ListenNSelectPairsState();
}

class ListenNSelectPairsInitial extends ListenNSelectPairsState {}

class ListenNSelectPairsLoading extends ListenNSelectPairsState {}

class ListenNSelectPairsLoaded extends ListenNSelectPairsState {
  final ListenNSelectPairsEntity entity;

  ListenNSelectPairsLoaded(this.entity);
}

class ListenNSelectPairsError extends ListenNSelectPairsState {
  final String message;

  ListenNSelectPairsError(this.message);
}
