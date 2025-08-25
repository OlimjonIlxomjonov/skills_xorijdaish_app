import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_n_complete_words/listen_n_complete_words_entity.dart';

import '../test_by_id/test_by_id_option_model.dart';

class ListenNCompleteWordsModel extends ListenNCompleteWordsEntity {
  ListenNCompleteWordsModel(
    super.imageUrl, {
    required super.id,
    required super.task,
    required super.options,
    required super.isImageAvailable,
    required super.isAudioAvailable,
    required super.audioUrl,
  });

  factory ListenNCompleteWordsModel.fromJson(Map<String, dynamic> json) {
    return ListenNCompleteWordsModel(
      json['image_url'] ?? '',
      id: json['id'] ?? 0,
      task: json['task'] ?? '',
      options:
          json['options'] != null
              ? (json['options'] as List)
                  .map((e) => TestByIdOptionModel.fromJson(e))
                  .toList()
              : [],
      isImageAvailable: json['is_image_available'] ?? false,
      isAudioAvailable: json['is_audio_available'] ?? false,
      audioUrl: json['audio_url'] ?? '',
    );
  }
}
