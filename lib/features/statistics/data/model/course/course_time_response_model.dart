import 'package:skills_xorijdaish/features/statistics/domain/entity/course/course_time_response.dart';

import 'course_time_model.dart';

class CourseTimeResponseModel extends CourseTimeResponse {
  CourseTimeResponseModel({required super.data});

  factory CourseTimeResponseModel.fromJson(Map<String, dynamic> json) {
    return CourseTimeResponseModel(
      data:
          (json['data'] as List)
              .map((item) => CourseTimeModel.fromJson(item))
              .toList(),
    );
  }
}
