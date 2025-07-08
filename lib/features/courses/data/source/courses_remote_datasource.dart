import 'dart:convert';

import 'package:skills_xorijdaish/core/common/constants/api_urls.dart';
import 'package:skills_xorijdaish/core/netwrok/dio_client.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/foreign_language/foreign_language_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/pre_trip_courses/pre_trip_response.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/soft_skills/soft_skills_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/countries_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/courses/courses_response_model.dart';

import 'courses_remote_datasource_impl.dart';

class CoursesRemoteDatasourceImpl implements CoursesRemoteDatasource {
  final DioClient dioClient = DioClient();

  @override
  Future<List<CountryModel>> getAllCountry() async {
    try {
      final response = await dioClient.get(ApiUrls.allCountries);

      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Successfully fetched all Countries! ${response.statusCode}');

        final Map<String, dynamic> data = response.data;
        final List<dynamic> jsonList = data['data'];

        return jsonList
            .map((item) => CountryModel.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception(
          'Failed to fetch countries with status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      logger.e('Error occurred while fetching countries: $e');
      rethrow;
    }
  }

  @override
  Future<CoursesResponseModel> getAllCourses() async {
    try {
      final response = await dioClient.get(ApiUrls.allCourses);
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Successfully fetched all Courses! ${response.statusCode}');
        return CoursesResponseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch Courses ${response.data}');
      }
    } catch (e) {
      logger.e('Error occurred while fetching $e');
      rethrow;
    }
  }

  @override
  Future<SoftSkillsResponseModel> getSoftSkills({required String query}) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.softSkillsLessons}$query",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Successfully fetched SoftSkill lessons! ${response.data}');
        return SoftSkillsResponseModel.fromJson(response.data);
      } else {
        throw Exception(
          'Error occurred while getting Soft Skills ${response.data}',
        );
      }
    } catch (e) {
      logger.e('Error occurred while fetching Soft Skills: $e');
      rethrow;
    }
  }

  @override
  Future<ForeignLanguageResponseModel> getForeignLanguage({
    required String query,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.foreignLanguageLessons}$query",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i(
          'Successfully fetched Foreign Language Lessons! ${response.statusCode}',
        );
        return ForeignLanguageResponseModel.fromJson(response.data);
      } else {
        throw Exception(
          'Could not get Foreign Language lessons ${response.statusCode}',
        );
      }
    } catch (e) {
      logger.e('Error occurred while fetching Foreign Language lessons $e');
      rethrow;
    }
  }

  @override
  Future<PreTripResponseModel> getPreTripCourses({
    required String query,
    required int countryId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.preTripCourses}$query?country_id=$countryId",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i(
          'Successfully fecthed all Pre Trip Courses! ${response.statusCode}',
        );
        return PreTripResponseModel.fromJson(response.data);
      } else {
        throw Exception('Could not get Pre Trip Courses');
      }
    } catch (e) {
      logger.e('Error occurred while fetching PreTrip Courses');
      rethrow;
    }
  }
}
