import 'package:skills_xorijdaish/features/courses/domain/entities/my_courses/my_courses_response.dart';

import 'my_courses_model.dart';

class MyCourseResponseModel extends MyCoursesResponse {
  MyCourseResponseModel({required super.data});

  factory MyCourseResponseModel.fromJson(Map<String, dynamic> json) {
    return MyCourseResponseModel(
      data:
          (json['data'] as List)
              .map((e) => MyCoursesModel.fromJson(e))
              .toList(),
    );
  }
}
