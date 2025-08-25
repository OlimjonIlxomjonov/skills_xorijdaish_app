class ListenNCompleteState {
  ListenNCompleteState();
}

class ListenNCompleteInitial extends ListenNCompleteState {}

class ListenNCompleteLoading extends ListenNCompleteState {}

class ListenNCompleteLoaded extends ListenNCompleteState {}

class ListenNCompleteError extends ListenNCompleteState {
  final String message;

  ListenNCompleteError(this.message);
}
