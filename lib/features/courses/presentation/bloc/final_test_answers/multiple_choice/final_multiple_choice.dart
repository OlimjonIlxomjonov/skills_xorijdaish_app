class FinalMultipleChoiceState {
  FinalMultipleChoiceState();
}

class FinalMultipleChoiceInitial extends FinalMultipleChoiceState {}

class FinalMultipleChoiceLoading extends FinalMultipleChoiceState {}

class FinalMultipleChoiceLoaded extends FinalMultipleChoiceState {}

class FinalMultipleChoiceError extends FinalMultipleChoiceState {
  final String message;

  FinalMultipleChoiceError(this.message);
}
