class ListenNCompleteEntity {
  final int id;
  final String task;
  final bool isImageAvailable;
  final bool isAudioAvailable;
  final String? imageUrl;
  final String? audioUrl;

  ListenNCompleteEntity({
    required this.id,
    required this.task,
    required this.isImageAvailable,
    required this.isAudioAvailable,
    this.imageUrl,
    this.audioUrl,
  });


}