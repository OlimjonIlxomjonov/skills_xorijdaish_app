import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/finish_final_test/finish_final_test_response.dart';

import 'finish_final_test_model.dart';

class FinishFinalTestResponseModel extends FinishFinalTestResponse {
  FinishFinalTestResponseModel({required super.ok, required super.data});

  factory FinishFinalTestResponseModel.fromJson(Map<String, dynamic> json) {
    return FinishFinalTestResponseModel(
      ok: json['ok'] ?? false,
      data: FinishFinalTestModel.fromJson(json['data'] ?? {}),
    );
  }
}
