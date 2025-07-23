import 'package:skills_xorijdaish/features/courses/data/models/countries_model.dart';

class MyCoursesEntity {
  final int id;
  final String title;
  final CountryModel? country;
  final int progress;
  final int seconds;
  final String humanSeconds;

  MyCoursesEntity({
    required this.id,
    required this.title,
    required this.country,
    required this.progress,
    required this.seconds,
    required this.humanSeconds,
  });
}
