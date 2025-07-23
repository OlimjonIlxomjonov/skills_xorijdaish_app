class AnswerState {
  AnswerState();
}

class AnswerInitial extends AnswerState {}

class AnswerLoading extends AnswerState {}

class AnswerLoaded extends AnswerState {}

class AnswerError extends AnswerState {
  final String message;

  AnswerError(this.message);
}
