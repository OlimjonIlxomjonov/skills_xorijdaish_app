import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/test_by_id/test_by_id_model.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_by_id/test_by_id_response.dart';

class TestByIdResponseModel extends TestByIdResponse {
  TestByIdResponseModel({required super.data});

  factory TestByIdResponseModel.fromJson(Map<String, dynamic> json) {
    return TestByIdResponseModel(data: TestByIdModel.fromJson(json['data']));
  }
}
