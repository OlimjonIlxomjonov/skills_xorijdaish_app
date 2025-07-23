import 'package:skills_xorijdaish/features/courses/domain/entities/lessons/lessons_entity.dart';

class LessonsModel extends LessonsEntity {
  LessonsModel({
    required super.id,
    required super.title,
    required super.isCameraVerificationEnabled,
    required super.stars,
    required super.isTestEnabled,
    required super.isLast,
    required super.isDone,
    required super.isAccessible,
    required super.videosDurationInSeconds,
    required super.videosDuration,
    required super.createdAt,
    required super.updatedAt,
    required super.imageUrl,
  });

  factory LessonsModel.fromJson(Map<String, dynamic> json) {
    return LessonsModel(
      id: json['id'],
      title: json['title'],
      isCameraVerificationEnabled: json['is_camera_verification_enabled'],
      stars: json['stars'],
      isTestEnabled: json['is_test_enabled'],
      isLast: json['is_last'],
      isDone: json['is_done'],
      isAccessible: json['is_accessible'],
      videosDurationInSeconds: json['videos_duration_in_seconds'],
      videosDuration: json['videos_duration'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      imageUrl: json['image_url'],
    );
  }
}
