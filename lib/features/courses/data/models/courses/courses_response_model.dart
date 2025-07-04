import 'package:skills_xorijdaish/features/courses/domain/entities/courses/courses_response.dart';

import 'course_data_model.dart';

class CoursesResponseModel extends CourseStatsResponse {
  CoursesResponseModel({required super.ok, required super.data});

  factory CoursesResponseModel.fromJson(Map<String, dynamic> json) {
    return CoursesResponseModel(
      ok: json['ok'],
      data: CoursesDataModel.fromJson(json['data']),
    );
  }
}
