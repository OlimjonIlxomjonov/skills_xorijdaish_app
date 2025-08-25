import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_and_complate/listen_n_complate.dart';

class ListenNCompleteModel extends ListenNCompleteEntity {
  ListenNCompleteModel({
    required super.id,
    required super.task,
    required super.isImageAvailable,
    required super.isAudioAvailable,
    super.imageUrl,
    super.audioUrl,
  });

  factory ListenNCompleteModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return ListenNCompleteModel(
      id: data['id'] ?? 0,
      task: data['task'] ?? '',
      isImageAvailable: data['is_image_available'] ?? false,
      isAudioAvailable: data['is_audio_available'] ?? false,
      imageUrl: data['image_url'] ?? '',
      audioUrl: data['audio_url'] ?? '',
    );
  }
}
