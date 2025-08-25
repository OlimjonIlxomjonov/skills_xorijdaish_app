import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/buy_course/buy_course_entity.dart';

class BuyCourseModel extends BuyCourseEntity {
  BuyCourseModel({required super.ok, required super.url});

  factory BuyCourseModel.fromJson(Map<String, dynamic> json) {
    return BuyCourseModel(ok: json['ok'], url: json['url']);
  }
}
