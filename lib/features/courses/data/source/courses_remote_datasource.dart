import 'dart:convert';

import 'package:skills_xorijdaish/core/common/constants/api_urls.dart';
import 'package:skills_xorijdaish/core/netwrok/dio_client.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/foreign_language/foreign_language_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/pre_trip_courses/pre_trip_response.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/skill_test/skill_test_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/skill_test/skill_test_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/soft_skills/soft_skills_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/countries_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/courses/courses_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/courses_by_id_model/courses_by_id_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/get_files/file_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/get_video/video_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons/lesson_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/lesson_test_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/test_by_id/test_by_id_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/my_courses/my_course_response_model.dart';

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
  }) async {
    try {
      final response = await dioClient.get("${ApiUrls.preTripCourses}$query");
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

  @override
  Future<LessonsResponseModel> getLessons({required int courseId}) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.lessons}$courseId/lessons",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.statusCode}');
        return LessonsResponseModel.fromJson(response.data);
      } else {
        throw Exception(
          'Error occurred! ${response.statusCode}: ${response.data}',
        );
      }
    } catch (e) {
      logger.e('Error occurred: $e');
      rethrow;
    }
  }

  @override
  Future<VideoModel> getVideo({
    required int courseId,
    required int lessonsId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.video}$courseId/lessons/$lessonsId/video",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.statusCode}');
        return VideoModel.fromJson(response.data);
      } else {
        throw Exception('Error! ${response.data}');
      }
    } catch (e) {
      logger.e("Error occurred! $e");
      rethrow;
    }
  }

  @override
  Future<FileModel> getFiles({
    required int courseId,
    required int lessonsId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.file}$courseId/lessons/$lessonsId/files",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success ${response.statusCode}: ${response.data}');
        return FileModel.fromJson(response.data['data'][0]);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e('Error occurred: $e');
      rethrow;
    }
  }

  @override
  Future<SkillTestModel> getSkillTest({required String query}) async {
    try {
      final response = await dioClient.get("${ApiUrls.skillTest}$query");
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success: ${response.data}');
        return SkillTestModel.fromJson(response.data['data']);
      } else {
        throw Exception('Error occurred: ${response.data}');
      }
    } catch (e) {
      logger.e('Error: $e');
      rethrow;
    }
  }

  @override
  Future<CoursesByIdModel> getCoursesById({required int courseId}) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.coursesById}$courseId/show",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success getCourseById! ${response.data}');
        return CoursesByIdModel.fromJson(response.data['data']);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e('Error: $e');
      rethrow;
    }
  }

  @override
  Future<MyCourseResponseModel> getMyCourse() async {
    try {
      final response = await dioClient.get(ApiUrls.myCourses);
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return MyCourseResponseModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  @override
  Future<LessonTestResponseModel> getLessonTests({
    required int courseId,
    required int lessonId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.lessonTests}$courseId/lessons/$lessonId/questions",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return LessonTestResponseModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  @override
  Future<TestByIdResponseModel> getTestById({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.testById}$courseId/lessons/$lessonId/questions/$questionId/show",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return TestByIdResponseModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  /// POST METHOD
  @override
  Future<void> startACourse({required int courseId}) async {
    try {
      final response = await dioClient.post(
        "${ApiUrls.startACourse}$courseId/start",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  @override
  Future<void> getAnswerTest({
    required int courseId,
    required int lessonId,
    required int questionId,
    required String testType,
    required int answerId,
  }) async {
    try {
      final response = await dioClient.post(
        "${ApiUrls.testAnswers}$courseId/lessons/$lessonId/questions/$questionId/answer/$testType",
        data: {'answer_id': answerId},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }
}
