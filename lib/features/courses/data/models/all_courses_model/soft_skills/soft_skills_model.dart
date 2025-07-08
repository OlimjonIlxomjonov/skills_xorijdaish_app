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
  });

  factory SoftSkillsModel.fromJson(Map<String, dynamic> json) {
    return SoftSkillsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      isStarted: json['is_started'] as bool,
      filesCount: json['files_count'] as int,
      lessonsCount: json['lessons_count'] as int,
      stars: json['stars'] as String,
      videosDurationInSeconds: json['videos_duration_in_seconds'] as int,
      videosDuration: json['videos_duration'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      imageUrl: json['image_url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'is_started': isStarted,
      'files_count': filesCount,
      'lessons_count': lessonsCount,
      'stars': stars,
      'videos_duration_in_seconds': videosDurationInSeconds,
      'videos_duration': videosDuration,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'image_url': imageUrl,
    };
  }
}
