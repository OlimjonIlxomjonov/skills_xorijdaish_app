import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_n_select_pairs/listen_n_select_pairs_entity.dart';

class FetchFinalListenNSelectPairsState {
  FetchFinalListenNSelectPairsState();
}

class FetchFinalListenNSelectPairsInitial
    extends FetchFinalListenNSelectPairsState {}

class FetchFinalListenNSelectPairsLoading
    extends FetchFinalListenNSelectPairsState {}

class FetchFinalListenNSelectPairsLoaded
    extends FetchFinalListenNSelectPairsState {
  final ListenNSelectPairsEntity entity;

  FetchFinalListenNSelectPairsLoaded(this.entity);
}

class FetchFinalListenNSelectPairsError
    extends FetchFinalListenNSelectPairsState {
  final String message;

  FetchFinalListenNSelectPairsError(this.message);
}
