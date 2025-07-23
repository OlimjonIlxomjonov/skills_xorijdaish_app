class LikeState {
  LikeState();
}

class LikeInitial extends LikeState {}

class LikeLoading extends LikeState {}

class LikeLoaded extends LikeState {}

class LikeError extends LikeState {
  final String message;

  LikeError(this.message);
}
