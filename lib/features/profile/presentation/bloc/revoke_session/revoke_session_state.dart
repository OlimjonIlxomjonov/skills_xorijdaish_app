class RevokeSessionState {
  RevokeSessionState();
}

class RevokeSessionInitial extends RevokeSessionState {}

class RevokeSessionLoading extends RevokeSessionState {}

class RevokeSessionLoaded extends RevokeSessionState {}

class RevokeSessionError extends RevokeSessionState {
  final String message;

  RevokeSessionError(this.message);
}
