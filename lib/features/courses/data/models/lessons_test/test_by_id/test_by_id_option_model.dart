import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_by_id/test_by_id_option_entity.dart';

class TestByIdOptionModel extends TestByIdOptionEntity {
  TestByIdOptionModel({required super.id, required super.title});

  factory TestByIdOptionModel.fromJson(Map<String, dynamic> json) {
    return TestByIdOptionModel(id: json['id'], title: json['title']);
  }
}
