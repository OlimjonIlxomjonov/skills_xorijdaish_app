class SoftSkillsEntity {
  final int id;
  final String title;
  final bool isStarted;
  final int filesCount;
  final int lessonsCount;
  final String stars;
  final int videosDurationInSeconds;
  final String videosDuration;
  final String createdAt;
  final String updatedAt;
  final String imageUrl;

  SoftSkillsEntity({
    required this.id,
    required this.title,
    required this.isStarted,
    required this.filesCount,
    required this.lessonsCount,
    required this.stars,
    required this.videosDurationInSeconds,
    required this.videosDuration,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });
}
