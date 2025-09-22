class FinalSelectPairsState {
  FinalSelectPairsState();
}

class FinalSelectPairsInitial extends FinalSelectPairsState {}

class FinalSelectPairsLoading extends FinalSelectPairsState {}

class FinalSelectPairsLoaded extends FinalSelectPairsState {}

class FinalSelectPairsError extends FinalSelectPairsState {
  final String message;

  FinalSelectPairsError(this.message);
}
