import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/all_courses_response.dart';

import '../../../domain/entities/all_courses/all_courses_data.dart';
import 'all_courses_data_model.dart';

class AllCoursesResponseModel extends AllCoursesResponse {
  AllCoursesResponseModel({required super.data});

  factory AllCoursesResponseModel.fromJson(Map<String, dynamic> json) {
    return AllCoursesResponseModel(
      data: List<AllCoursesData>.from(
        json['data'].map((item) => AllCoursesDataModel.fromJson(item)),
      ),
    );
  }
}
