import 'package:skills_xorijdaish/features/statistics/domain/entity/course/course_time_entity.dart';

class CourseTimeModel extends CourseTimeEntity {
  CourseTimeModel({
    required super.id,
    required super.title,
    required super.activeTimesInSeconds,
    required super.progress,
    required super.status,
    required super.createdAt,
    required super.country,
    required super.countryLanguage,
    required super.activeTimesInHumanReadable,
  });

  factory CourseTimeModel.fromJson(Map<String, dynamic> json) {
    return CourseTimeModel(
      id: json['id'],
      title: json['title'],
      country: json['country'],
      countryLanguage: json['country_language'],
      activeTimesInSeconds: json['active_times_in_seconds'],
      progress: json['progress'],
      status: json['status'],
      createdAt: json['created_at'],
      activeTimesInHumanReadable: json['active_times_in_human_readable'],
    );
  }
}
