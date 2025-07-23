import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_by_id/test_by_id_option_entity.dart';

class TestByIdEntity {
  final int id;
  final String task;
  final String question;
  final List<TestByIdOptionEntity> options;

  TestByIdEntity({
    required this.id,
    required this.task,
    required this.question,
    required this.options,
  });
}
