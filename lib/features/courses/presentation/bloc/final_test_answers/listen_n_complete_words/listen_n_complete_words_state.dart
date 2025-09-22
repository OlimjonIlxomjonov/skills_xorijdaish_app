class ListenNCompleteWordsState {
  ListenNCompleteWordsState();
}

class ListenNCompleteWordsInitial extends ListenNCompleteWordsState {}

class ListenNCompleteWordsLoading extends ListenNCompleteWordsState {}

class ListenNCompleteWordsLoaded extends ListenNCompleteWordsState {}

class ListenNCompleteWordsError extends ListenNCompleteWordsState {
  final String message;

  ListenNCompleteWordsError(this.message);
}
