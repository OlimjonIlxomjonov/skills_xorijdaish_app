import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/soft_skills/soft_skills_model.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/soft_skills/soft_skills_response.dart';

class SoftSkillsResponseModel extends SoftSkillsResponse {
  SoftSkillsResponseModel({required super.data});

  factory SoftSkillsResponseModel.fromJson(Map<String, dynamic> json) {
    return SoftSkillsResponseModel(
      data:
          (json['data'] as List)
              .map((item) => SoftSkillsModel.fromJson(item))
              .toList(),
    );
  }
}
