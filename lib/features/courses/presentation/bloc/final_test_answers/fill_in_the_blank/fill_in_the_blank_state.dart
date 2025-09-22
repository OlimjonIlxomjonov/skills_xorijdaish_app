class FillInTheBlankState {
  FillInTheBlankState();
}

class FillInTheBlankInitial extends FillInTheBlankState {}

class FillInTheBlankLoading extends FillInTheBlankState {}

class FillInTheBlankLoaded extends FillInTheBlankState {}

class FillInTheBlankError extends FillInTheBlankState {
  final String message;

  FillInTheBlankError(this.message);
}
