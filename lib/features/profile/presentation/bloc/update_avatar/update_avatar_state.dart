class UpdateAvatarState {
  UpdateAvatarState();
}

class UpdateAvatarInitial extends UpdateAvatarState {}

class UpdateAvatarLoading extends UpdateAvatarState {}

class UpdateAvatarLoaded extends UpdateAvatarState {}

class UpdateAvatarError extends UpdateAvatarState {
  final String message;

  UpdateAvatarError(this.message);
}
