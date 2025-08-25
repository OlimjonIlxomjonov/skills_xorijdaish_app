class RaedAllState {
  RaedAllState();
}

class RaedAllInitial extends RaedAllState {}

class RaedAllLoading extends RaedAllState {}

class RaedAllLoaded extends RaedAllState {}

class RaedAllError extends RaedAllState {
  final String message;

  RaedAllError(this.message);
}
