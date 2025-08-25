import 'package:skills_xorijdaish/features/courses/domain/entities/courses/courses_data_entity.dart';

import 'courses_category_model.dart';

class CoursesDataModel extends CourseData {
  CoursesDataModel({
    required super.foreignCourses,
    required super.pretripCourses,
    required super.softSkillCourses,
    required super.skillTestCourses,
  });

  factory CoursesDataModel.fromJson(Map<String, dynamic> json) {
    return CoursesDataModel(
      foreignCourses: CoursesCategoryModel.fromJson(json['foreign_courses']),
      pretripCourses: CoursesCategoryModel.fromJson(json['pretrip_courses']),
      softSkillCourses: CoursesCategoryModel.fromJson(
        json['soft_skill_courses'],
      ),
      skillTestCourses: CoursesCategoryModel.fromJson(json['skill_test']),
    );
  }
}
