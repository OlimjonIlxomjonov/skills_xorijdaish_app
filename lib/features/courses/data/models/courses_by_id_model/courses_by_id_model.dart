import 'package:skills_xorijdaish/features/courses/domain/entities/get_courses_by_id/course_by_id_entity.dart';

import '../countries_model.dart';

class CoursesByIdModel extends CourseByIdEntity {
  CoursesByIdModel({
    required super.id,
    required super.title,
    required super.lastLessonId,
    required super.isPaid,
    required super.country,
    required super.description,
    required super.progress,
    required super.isStarted,
    required super.videosDurationInSeconds,
    required super.videos,
    required super.filesCount,
    required super.lessonsCount,
    required super.stars,
    required super.hasCertificate,
    required super.certificateUrl,
    required super.createdAt,
    required super.updatedAt,
    required super.imageUrl,
    required super.isBlocked,
    required super.priceInfo,
  });

  factory CoursesByIdModel.fromJson(Map<String, dynamic> json) {
    return CoursesByIdModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      lastLessonId: json['last_lesson_id'] ?? 0,
      isPaid: json['is_paid'] ?? false,
      country:
          json['country'] != null
              ? CountryModel.fromJson(json['country'])
              : CountryModel.empty(),
      description: json['description'] ?? '',
      progress: json['progress'] ?? 0,
      isStarted: json['is_started'] ?? false,
      videosDurationInSeconds: json['videos_duration_in_seconds'] ?? 0,
      videos: json['videos'] ?? 0,
      filesCount: json['files_count'] ?? 0,
      lessonsCount: json['lessons_count'] ?? 0,
      stars: json['stars'] ?? 0,
      hasCertificate: json['has_certificate'] ?? false,
      certificateUrl: json['certificate_url'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      imageUrl: json['image_url'] ?? '',
      isBlocked: json['is_blocked'] ?? false,
      priceInfo: json['price_info'] ?? 0,
    );
  }
}
