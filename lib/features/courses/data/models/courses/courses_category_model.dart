import 'package:skills_xorijdaish/features/courses/domain/entities/courses/courses_category_entity.dart';

class CoursesCategoryModel extends CourseCategory {
  CoursesCategoryModel({required super.stars, required super.count});

  factory CoursesCategoryModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return CoursesCategoryModel(stars: '0', count: 0);
    }

    return CoursesCategoryModel(
      stars: json['stars']?.toString() ?? '0',
      count: json['count'] ?? 0,
    );
  }
}
