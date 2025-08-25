import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_by_id/test_by_id_option_entity.dart';

class FillInTheBlankEntity {
  final int id;
  final String tasks;
  final String question;
  final List<TestByIdOptionEntity> options;
  final bool isImageAvailable;
  final bool isAudioAvailable;
  final String? imageUrl;
  final String? audioUrl;

  FillInTheBlankEntity(
    this.imageUrl,
    this.audioUrl, {
    required this.id,
    required this.tasks,
    required this.question,
    required this.options,
    required this.isImageAvailable,
    required this.isAudioAvailable,
  });
}
