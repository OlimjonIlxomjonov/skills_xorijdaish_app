import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/skill_test/skill_test_model.dart';

import '../../../../domain/entities/all_courses/skill_test/skill_test_response.dart';

class SkillTestResponseModel extends SkillTestResponse {
  SkillTestResponseModel({required super.data});

  factory SkillTestResponseModel.fromJson(Map<String, dynamic> json) {
    return SkillTestResponseModel(
      data:
          (json['data'] as List)
              .map((e) => SkillTestModel.fromJson(e))
              .toList(),
    );
  }
}
