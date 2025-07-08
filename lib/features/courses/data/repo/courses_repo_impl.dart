import 'package:skills_xorijdaish/features/courses/data/source/courses_remote_datasource_impl.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/foreign_language/foreign_language_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/pre_trip_courses/pre_trip_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/soft_skills/soft_skills_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/courses/courses_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

import '../../domain/entities/countries_entity.dart';

class CoursesRepoImpl implements CoursesRepository {
  final CoursesRemoteDatasource datasource;

  CoursesRepoImpl(this.datasource);

  @override
  Future<List<CountryEnt>> fetchAllCounties() {
    return datasource.getAllCountry();
  }

  @override
  Future<CourseStatsResponse> fetchAllCourses() {
    return datasource.getAllCourses();
  }

  @override
  Future<SoftSkillsResponse> fetchSoftSkills({required String query}) {
    return datasource.getSoftSkills(query: query);
  }

  @override
  Future<ForeignLanguageResponse> fetchForeignLanguage({
    required String query,
  }) {
    return datasource.getForeignLanguage(query: query);
  }

  @override
  Future<PreTripResponse> fetchPreTripCourses({
    required String query,
    required int countryId,
  }) {
    return datasource.getPreTripCourses(query: query, countryId: countryId);
  }
}
