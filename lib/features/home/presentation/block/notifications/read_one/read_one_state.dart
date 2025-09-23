class ReadOneState {
  ReadOneState();
}

class ReadOneInitial extends ReadOneState {}

class ReadOneLoading extends ReadOneState {}

class ReadOneLoaded extends ReadOneState {}

class ReadOneError extends ReadOneState {
  final String message;

  ReadOneError(this.message);
}
