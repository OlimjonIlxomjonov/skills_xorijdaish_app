class SetVideoTimeState {
  SetVideoTimeState();
}

class SetVideoTimeInitial extends SetVideoTimeState {}

class SetVideoTimeLoading extends SetVideoTimeState {}

class SetVideoTimeLoaded extends SetVideoTimeState {
  final bool isWatched;

  SetVideoTimeLoaded(this.isWatched);
}

class SetVideoTimeError extends SetVideoTimeState {
  final String message;

  SetVideoTimeError(this.message);
}
