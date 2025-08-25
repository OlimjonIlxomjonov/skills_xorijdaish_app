import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/soft_skills/soft_skills_entity.dart';

class SoftSkillsModel extends SoftSkillsEntity {
  SoftSkillsModel({
    required super.id,
    required super.title,
    required super.isStarted,
    required super.filesCount,
    required super.lessonsCount,
    required super.stars,
    required super.videosDurationInSeconds,
    required super.videosDuration,
    required super.createdAt,
    required super.updatedAt,
    required super.imageUrl,
    required super.isDone,
  });

  factory SoftSkillsModel.fromJson(Map<String, dynamic> json) {
    return SoftSkillsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      isStarted: json['is_started'] ?? false,
      filesCount: json['files_count'] ?? 0,
      lessonsCount: json['lessons_count'] ?? 0,
      stars: json['stars'] ?? '',
      videosDurationInSeconds: json['videos_duration_in_seconds'] ?? 0,
      videosDuration: json['videos_duration'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      imageUrl: json['image_url'] ?? '',
      isDone: json['is_done'] ?? false,
    );
  }
}
