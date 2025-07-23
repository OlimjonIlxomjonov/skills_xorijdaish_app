import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/lessons_test_model.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/lesson_tests_response.dart';

class LessonTestResponseModel extends LessonTestsResponse {
  LessonTestResponseModel({required super.data});

  factory LessonTestResponseModel.fromJson(Map<String, dynamic> json) {
    return LessonTestResponseModel(
      data:
          (json['data'] as List)
              .map((e) => LessonsTestModel.fromJson(e))
              .toList(),
    );
  }
}
