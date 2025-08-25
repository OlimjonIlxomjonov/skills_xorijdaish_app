import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_by_id/test_by_id_option_entity.dart';

class ListenNCompleteWordsEntity {
  final int id;
  final String task;
  final List<TestByIdOptionEntity> options;
  final bool isImageAvailable;
  final bool isAudioAvailable;
  final String? imageUrl;
  final String audioUrl;

  ListenNCompleteWordsEntity(
    this.imageUrl, {
    required this.id,
    required this.task,
    required this.options,
    required this.isImageAvailable,
    required this.isAudioAvailable,
    required this.audioUrl,
  });
}
