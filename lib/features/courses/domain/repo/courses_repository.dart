import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/foreign_language/foreign_language_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/pre_trip_courses/pre_trip_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/soft_skills/soft_skills_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/courses/courses_response.dart';

import '../entities/countries_entity.dart';

abstract class CoursesRepository {
  Future<List<CountryEnt>> fetchAllCounties();

  Future<CourseStatsResponse> fetchAllCourses();

  Future<SoftSkillsResponse> fetchSoftSkills({required String query});

  Future<ForeignLanguageResponse> fetchForeignLanguage({required String query});

  Future<PreTripResponse> fetchPreTripCourses({
    required String query,
    required int countryId,
  });
}
