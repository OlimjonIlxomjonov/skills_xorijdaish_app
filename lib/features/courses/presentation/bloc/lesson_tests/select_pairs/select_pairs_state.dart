import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_select_pairs/select_pair_response.dart';

class SelectPairsState {
  SelectPairsState();
}

class SelectPairsInitial extends SelectPairsState {}

class SelectPairsLoading extends SelectPairsState {}

class SelectPairsLoaded extends SelectPairsState {
  final SelectPairResponse response;

  SelectPairsLoaded(this.response);
}

class SelectPairsError extends SelectPairsState {
  final String message;

  SelectPairsError(this.message);
}
