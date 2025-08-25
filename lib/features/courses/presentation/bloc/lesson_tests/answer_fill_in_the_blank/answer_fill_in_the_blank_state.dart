class AnswerFillInTheBlankState {
  AnswerFillInTheBlankState();
}

class AnswerFillInTheBlankInitial extends AnswerFillInTheBlankState {}

class AnswerFillInTheBlankLoading extends AnswerFillInTheBlankState {}

class AnswerFillInTheBlankLoaded extends AnswerFillInTheBlankState {}

class AnswerFillInTheBlankError extends AnswerFillInTheBlankState {
  final String message;

  AnswerFillInTheBlankError(this.message);
}
