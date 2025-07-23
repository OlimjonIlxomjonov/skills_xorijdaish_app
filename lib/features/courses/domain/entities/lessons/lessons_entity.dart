class LessonsEntity {
  final int id;
  final String title;
  final bool isCameraVerificationEnabled;
  final String stars;
  final bool isTestEnabled;
  final bool isLast;
  bool isDone;
  final bool isAccessible;
  final int videosDurationInSeconds;
  final String videosDuration;
  final String createdAt;
  final String updatedAt;
  final String imageUrl;

  LessonsEntity({
    required this.id,
    required this.title,
    required this.isCameraVerificationEnabled,
    required this.stars,
    required this.isTestEnabled,
    required this.isLast,
    required this.isDone,
    required this.isAccessible,
    required this.videosDurationInSeconds,
    required this.videosDuration,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });
}
