import '../../countries_entity.dart';

class ForeignLanguageEntity {
  final int id;
  final String title;
  final bool isStarted;
  final int filesCount;
  final int lessonsCount;
  final int videosDurationInSeconds;
  final String videosDuration;
  final String stars;
  final String createdAt;
  final String updatedAt;
  final String imageUrl;
  final CountryEnt country;

  ForeignLanguageEntity({
    required this.id,
    required this.title,
    required this.isStarted,
    required this.filesCount,
    required this.lessonsCount,
    required this.videosDurationInSeconds,
    required this.videosDuration,
    required this.stars,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
    required this.country,
  });
}
