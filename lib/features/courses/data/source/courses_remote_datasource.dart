import 'dart:convert';

import 'package:skills_xorijdaish/core/common/constants/api_urls.dart';
import 'package:skills_xorijdaish/core/netwrok/dio_client.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
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
}
