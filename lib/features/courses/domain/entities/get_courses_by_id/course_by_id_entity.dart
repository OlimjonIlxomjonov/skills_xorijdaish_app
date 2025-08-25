import 'package:skills_xorijdaish/features/courses/domain/entities/countries_entity.dart';

class CourseByIdEntity {
  final int id;
  final String title;
  final int lastLessonId;
  final bool isPaid;
  final CountryEnt country;
  final String description;
  final int progress;
  final bool isStarted;
  final String videosDuration;
  final int videosDurationInSeconds;
  final int videos;
  final int filesCount;
  final int lessonsCount;
  final int stars;
  final bool hasCertificate;
  final String? certificateUrl;
  final String createdAt;
  final String updatedAt;
  final String imageUrl;
  final bool isBlocked;
  final dynamic priceInfo;

  CourseByIdEntity({
    required this.id,
    required this.videosDuration,
    required this.title,
    required this.lastLessonId,
    required this.isPaid,
    required this.country,
    required this.description,
    required this.progress,
    required this.isStarted,
    required this.videosDurationInSeconds,
    required this.videos,
    required this.filesCount,
    required this.lessonsCount,
    required this.stars,
    required this.hasCertificate,
    required this.certificateUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
    required this.isBlocked,
    required this.priceInfo,
  });
}
