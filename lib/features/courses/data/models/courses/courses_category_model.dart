import 'package:skills_xorijdaish/features/courses/domain/entities/courses/courses_category_entity.dart';

class CoursesCategoryModel extends CourseCategory {
  CoursesCategoryModel({required super.stars, required super.count});

  factory CoursesCategoryModel.fromJson(Map<String, dynamic> json) {
    return CoursesCategoryModel(stars: json['stars'], count: json['count']);
  }
}
