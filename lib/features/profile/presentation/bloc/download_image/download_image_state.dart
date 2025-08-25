class DownloadImageState {
  DownloadImageState();
}

class DownloadImageInitial extends DownloadImageState {}

class DownloadImageLoading extends DownloadImageState {}

class DownloadImageLoaded extends DownloadImageState {}

class DownloadImageError extends DownloadImageState {
  final String message;

  DownloadImageError(this.message);
}
