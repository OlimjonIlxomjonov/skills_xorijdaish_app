import 'package:skills_xorijdaish/features/courses/domain/entities/lessons/lessons_by_id/lessons_by_id_entity.dart';

class LessonByIdModel extends LessonsByIdEntity {
  LessonByIdModel({
    required super.id,
    required super.title,
    required super.content,
    required super.isCameraVerificationEnabled,
    required super.isStarted,
    required super.isDone,
    required super.stars,
    required super.faceIdInterval,
    required super.filesCount,
    required super.thumbnail,
    required super.thumbnailUrl,
  });

  factory LessonByIdModel.fromJson(Map<String, dynamic> json) {
    return LessonByIdModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      isCameraVerificationEnabled:
          json['is_camera_verification_enabled'] ?? false,
      isStarted: json['is_started'] ?? false,
      isDone: json['is_done'] ?? false,
      stars: json['stars'] ?? '',
      faceIdInterval: json['face_id_interval'] ?? 0,
      filesCount: json['files_count'] ?? 0,
      thumbnail: json['thumbnail'] ?? '',
      thumbnailUrl: json['thumbnail_url'] ?? '',
    );
  }
}
