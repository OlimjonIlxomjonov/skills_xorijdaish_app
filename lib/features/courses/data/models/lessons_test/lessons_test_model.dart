import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/lesson_test_entity.dart';

class LessonsTestModel extends LessonTestEntity {
  LessonsTestModel({required super.id, required super.type});

  factory LessonsTestModel.fromJson(Map<String, dynamic> json) {
    return LessonsTestModel(id: json['id'], type: json['type']);
  }
}
