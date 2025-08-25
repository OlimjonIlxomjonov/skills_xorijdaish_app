class AnswerListenCompleteState {
  AnswerListenCompleteState();
}

class AnswerListenCompleteInitial extends AnswerListenCompleteState {}

class AnswerListenCompleteLoading extends AnswerListenCompleteState {}

class AnswerListenCompleteLoaded extends AnswerListenCompleteState {}

class AnswerListenCompleteError extends AnswerListenCompleteState {
  final String message;

  AnswerListenCompleteError(this.message);
}
