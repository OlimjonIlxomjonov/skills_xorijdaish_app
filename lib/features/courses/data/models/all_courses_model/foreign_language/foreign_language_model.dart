import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/foreign_language/foreign_language_entity.dart';

import '../../countries_model.dart';

class ForeignLanguageModel extends ForeignLanguageEntity {
  ForeignLanguageModel({
    required super.id,
    required super.title,
    required super.isStarted,
    required super.filesCount,
    required super.lessonsCount,
    required super.videosDurationInSeconds,
    required super.videosDuration,
    required super.stars,
    required super.createdAt,
    required super.updatedAt,
    required super.imageUrl,
    required super.country,
  });

  factory ForeignLanguageModel.fromJson(Map<String, dynamic> json) {
    return ForeignLanguageModel(
      id: json['id'],
      title: json['title'] ?? '',
      isStarted: json['is_started'],
      filesCount: json['files_count'],
      lessonsCount: json['lessons_count'],
      videosDurationInSeconds: json['videos_duration_in_seconds'],
      videosDuration: json['videos_duration'],
      stars: json['stars'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      imageUrl: json['image_url'],
      country: CountryModel.fromJson(json['country']),
    );
  }
}
