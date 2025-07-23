import 'package:skills_xorijdaish/features/courses/domain/entities/my_courses/my_courses_entity.dart';

import '../countries_model.dart';

class MyCoursesModel extends MyCoursesEntity {
  MyCoursesModel({
    required super.id,
    required super.title,
    required super.country,
    required super.progress,
    required super.seconds,
    required super.humanSeconds,
  });

  factory MyCoursesModel.fromJson(Map<String, dynamic> json) {
    return MyCoursesModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      country:
          json['country'] != null
              ? CountryModel.fromJson(json['country'])
              : CountryModel.empty(),
      progress: json['progress'] ?? 0,
      seconds: json['seconds'] ?? 0,
      humanSeconds: json['human_seconds'] ?? '',
    );
  }
}
