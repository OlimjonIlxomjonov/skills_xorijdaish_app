import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/test_by_id/test_by_id_option_model.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_by_id/test_by_id_entity.dart';

class TestByIdModel extends TestByIdEntity {
  TestByIdModel({
    required super.id,
    required super.task,
    required super.question,
    required super.options,
  });

  factory TestByIdModel.fromJson(Map<String, dynamic> json) {
    return TestByIdModel(
      id: json['id'],
      task: json['task'],
      question: json['question'],
      options:
          (json['options'] as List)
              .map((option) => TestByIdOptionModel.fromJson(option))
              .toList(),
    );
  }
}
