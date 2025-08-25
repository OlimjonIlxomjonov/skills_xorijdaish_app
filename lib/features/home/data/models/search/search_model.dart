import 'package:skills_xorijdaish/features/home/domain/entities/search/search_entity.dart';

import '../../../../courses/data/models/all_courses_model/foreign_language/foreign_language_model.dart';
import '../../../../courses/data/models/all_courses_model/pre_trip_courses/pre_trip_model.dart';
import '../../../../courses/data/models/all_courses_model/soft_skills/soft_skills_model.dart';

class SearchModel extends SearchEntity {
  SearchModel({
    required super.foreignLanguages,
    required super.preTripCourses,
    required super.softSkills,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      foreignLanguages:
          (json['foreign_languages'] as List)
              .map((e) => ForeignLanguageModel.fromJson(e))
              .toList(),
      preTripCourses:
          (json['pre_trip_courses'] as List)
              .map((e) => PreTripModel.fromJson(e))
              .toList(),
      softSkills:
          (json['soft_skills'] as List)
              .map((e) => SoftSkillsModel.fromJson(e))
              .toList(),
    );
  }
}
