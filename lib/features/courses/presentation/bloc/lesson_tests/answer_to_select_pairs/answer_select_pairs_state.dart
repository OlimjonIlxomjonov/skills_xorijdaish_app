class AnswerSelectPairsState {
  AnswerSelectPairsState();
}

class AnswerSelectPairsInitial extends AnswerSelectPairsState {}

class AnswerSelectPairsLoading extends AnswerSelectPairsState {}

class AnswerSelectPairsLoaded extends AnswerSelectPairsState {}

class AnswerSelectPairsError extends AnswerSelectPairsState {
  final String message;

  AnswerSelectPairsError(this.message);
}
