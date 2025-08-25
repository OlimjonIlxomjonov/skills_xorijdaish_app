import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_select_pairs/pair_text_option_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_select_pairs/select_pair_response.dart';

class FetchFinalSelectPairsState {
  FetchFinalSelectPairsState();
}

class FetchFinalSelectPairsInitial extends FetchFinalSelectPairsState {}

class FetchFinalSelectPairsLoading extends FetchFinalSelectPairsState {}

class FetchFinalSelectPairsLoaded extends FetchFinalSelectPairsState {
  final SelectPairResponse response;

  FetchFinalSelectPairsLoaded(this.response);
}

class FetchFinalSelectPairsError extends FetchFinalSelectPairsState {
  final String message;

  FetchFinalSelectPairsError(this.message);
}
