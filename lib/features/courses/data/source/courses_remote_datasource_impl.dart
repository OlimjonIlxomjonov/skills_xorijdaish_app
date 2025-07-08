import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/foreign_language/foreign_language_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/pre_trip_courses/pre_trip_response.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/soft_skills/soft_skills_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/countries_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/courses/courses_response_model.dart';

abstract class CoursesRemoteDatasource {
  Future<List<CountryModel>> getAllCountry();

  Future<CoursesResponseModel> getAllCourses();

  Future<SoftSkillsResponseModel> getSoftSkills({required String query});

  Future<ForeignLanguageResponseModel> getForeignLanguage({
    required String query,
  });

  Future<PreTripResponseModel> getPreTripCourses({
    required String query,
    required int countryId,
  });
}
