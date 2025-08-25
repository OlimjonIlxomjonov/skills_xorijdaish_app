class LessonsByIdEntity  {
  final int id;
  final String title;
  final String content;
  final bool isCameraVerificationEnabled;
  final bool isStarted;
  final bool isDone;
  final String stars;
  final int faceIdInterval;
  final int filesCount;
  final String thumbnail;
  final String thumbnailUrl;

  LessonsByIdEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.isCameraVerificationEnabled,
    required this.isStarted,
    required this.isDone,
    required this.stars,
    required this.faceIdInterval,
    required this.filesCount,
    required this.thumbnail,
    required this.thumbnailUrl,
  });


}