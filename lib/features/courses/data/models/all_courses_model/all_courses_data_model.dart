import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/all_courses_data.dart';

class AllCoursesDataModel extends AllCoursesData {
  AllCoursesDataModel({
    required super.id,
    required super.title,
    required super.filesCount,
    required super.lessonsCount,
    required super.stars,
    required super.createdAt,
    required super.updatedAt,
    required super.imageUrl,
  });

  factory AllCoursesDataModel.fromJson(Map<String, dynamic> json) {
    return AllCoursesDataModel(
      id: json['id'],
      title: json['title'],
      filesCount: json['files_count'],
      lessonsCount: json['lessons_count'],
      stars: json['stars'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'files_count': filesCount,
      'lessons_count': lessonsCount,
      'stars': stars,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'image_url': imageUrl,
    };
  }
}
