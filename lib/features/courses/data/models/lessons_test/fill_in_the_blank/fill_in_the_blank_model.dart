import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/fill_in_the_blank/fill_in_the_blank_entity.dart';

import '../test_by_id/test_by_id_option_model.dart';

class FillInTheBlankModel extends FillInTheBlankEntity {
  FillInTheBlankModel(
    super.imageUrl,
    super.audioUrl, {
    required super.id,
    required super.tasks,
    required super.question,
    required super.options,
    required super.isImageAvailable,
    required super.isAudioAvailable,
  });

  factory FillInTheBlankModel.fromJson(Map<String, dynamic> json) {
    return FillInTheBlankModel(
      id: json['id'] ?? 0,
      tasks: json['task'] ?? '',
      question: json['question'] ?? '',
      options:
          json['options'] != null
              ? (json['options'] as List)
                  .map((e) => TestByIdOptionModel.fromJson(e))
                  .toList()
              : [],
      isImageAvailable: json['is_image_available'] ?? false,
      isAudioAvailable: json['is_audio_available'] ?? false,
      json['image_url'] ?? '',
      json['audio_url'] ?? '',
    );
  }
}
