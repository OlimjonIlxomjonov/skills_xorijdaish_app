class FaceRecMyIdState {
  FaceRecMyIdState();
}

class FaceRecMyIdInitial extends FaceRecMyIdState {}

class FaceRecMyIdLoading extends FaceRecMyIdState {}

class FaceRecMyIdLoaded extends FaceRecMyIdState {}

class FaceRecMyIdError extends FaceRecMyIdState {
  final String message;

  FaceRecMyIdError(this.message);
}
