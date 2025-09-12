import 'dart:io';

import 'package:dio/dio.dart';
import 'package:skills_xorijdaish/core/common/constants/api_urls.dart';
import 'package:skills_xorijdaish/core/netwrok/dio_client.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/buy_course/buy_course_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/foreign_language/foreign_language_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/pre_trip_courses/pre_trip_response.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/skill_test/skill_test_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/soft_skills/soft_skills_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/countries_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/courses/courses_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/courses_by_id_model/courses_by_id_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/get_files/file_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/get_video/video_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons/lesson_by_id/lesson_by_id_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons/lesson_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/fill_in_the_blank/fill_in_the_blank_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/finish_final_test/finish_final_test_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/finish_test/finish_test_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/lesson_test_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/listen_n_complate/listen_n_complete_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/listen_n_completle_words/listen_n_complete_words_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/listen_n_select_pairs/listen_n_select_pairs_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/multiple_choice_with_pictures/multiple_choice_with_pictures_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/select_pairs/select_pair_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/test_by_id/test_by_id_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/my_courses/my_course_response_model.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/fill_in_the_blank/fill_in_the_blank_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_and_complate/listen_n_complate.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_n_complete_words/listen_n_complete_words_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_n_select_pairs/listen_n_select_pairs_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/multiple_choice_with_pictures/multiple_choice_with_pictures.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_select_pairs/pair_text_option_entity.dart';

import '../models/lessons_test/select_pairs/pair_text_options_model.dart';
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
  Future<LessonsResponseModel> getLessons({
    required int courseId,
    required int page,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.lessons}$courseId/lessons?page=$page",
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

  @override
  Future<SelectPairResponseModel> getSelectPairs({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.selectPairs}$courseId/lessons/$lessonId/questions/$questionId/show",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return SelectPairResponseModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  @override
  Future<void> getAnswerSelectPairs({
    required int courseId,
    required int lessonId,
    required int questionId,
    required String testType,
    required int answerId,
    required String pairText,
  }) async {
    try {
      final response = await dioClient.post(
        "${ApiUrls.answerSelectPairs}$courseId/lessons/$lessonId/questions/$questionId/answer/$testType",
        data: {
          "answers": [
            {"id": answerId, "pair_text": pairText},
          ],
        },
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
  Future<FinishTestModel> getFinishTest({
    required int courseId,
    required int lessonId,
  }) async {
    try {
      final response = await dioClient.post(
        "${ApiUrls.finishTest}$courseId/lessons/$lessonId/questions/finish",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return FinishTestModel.fromJson(response.data['data']);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  @override
  Future<LessonTestResponseModel> getFinalTestCourse({
    required int courseId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.finalTestCourse}$courseId/questions",
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
  Future<TestByIdResponseModel> getFinalTestById({
    required int courseId,
    required int questionId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.finalTestById}$courseId/questions/$questionId/show",
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

  @override
  Future<ListenNCompleteModel> getListenNComplete({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.listenNComplete}$courseId/lessons/$lessonId/questions/$questionId/show",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return ListenNCompleteModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  @override
  Future<void> getAnswerListenNComplete({
    required int courseId,
    required int lessonId,
    required int questionId,
    required String testType,
    required String answer,
  }) async {
    try {
      final response = await dioClient.post(
        "${ApiUrls.answerListenNComplete}$courseId/lessons/$lessonId/questions/$questionId/answer/$testType",
        data: {'answer': answer},
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
  Future<PreTripResponseModel> getPreTripByCountry({
    required int countryId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.preTripByCountry}$countryId",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return PreTripResponseModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  @override
  Future<void> setVideoTime({
    required int courseId,
    required int lessonId,
    required int time,
    required bool isWatched,
  }) async {
    try {
      final response = await dioClient.post(
        "${ApiUrls.setVideoTime}$courseId/lessons/$lessonId/video/$time",
        data: {'time': time, 'is_watched': isWatched},
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
  Future<FillInTheBlankModel> getFillInTheBlankModel({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.fillInTheBlank}$courseId/lessons/$lessonId/questions/$questionId/show",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return FillInTheBlankModel.fromJson(response.data['data']);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  @override
  Future<ListenNCompleteWordsModel> getListenNCompleteWords({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.listenNCompleteWords}$courseId/lessons/$lessonId/questions/$questionId/show",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return ListenNCompleteWordsModel.fromJson(response.data['data']);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  @override
  Future<MultipleChoiceWithPicturesModel> getMultipleChoiceWithPictures({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.multipleChoiceWithPictures}$courseId/lessons/$lessonId/questions/$questionId/show",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return MultipleChoiceWithPicturesModel.fromJson(response.data['data']);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  @override
  Future<void> getAnswerFillInTheBlank({
    required int courseId,
    required int lessonId,
    required int questionId,
    required String testType,
    required List<int> answerIds,
  }) async {
    try {
      final response = await dioClient.post(
        "${ApiUrls.answerFillInTheBlank}$courseId/lessons/$lessonId/questions/$questionId/answer/$testType",
        data: {'answer_ids': answerIds},
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
  Future<ListenNSelectPairsModel> getListenNSelectPairs({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.listenNSelectPairs}$courseId/lessons/$lessonId/questions/$questionId/show",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return ListenNSelectPairsModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  @override
  Future<LessonByIdModel> getLessonById({
    required int courseId,
    required int lessonId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.lessonById}$courseId/lessons/$lessonId/show",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return LessonByIdModel.fromJson(response.data['data']);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  @override
  Future<FinishFinalTestResponseModel> getFinishFinalTest({
    required int courseId,
  }) async {
    try {
      final response = await dioClient.post(
        "${ApiUrls.finishFinalTest}$courseId/questions/finish",
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return FinishFinalTestResponseModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  /// Final tests
  @override
  Future<void> getAnsFinalMultipleChoice({
    required int courseId,
    required int questionId,
    required int answerId,
    required String testType,
  }) async {
    try {
      final response = await dioClient.post(
        "${ApiUrls.ansFinalMultipleChoice}$courseId/questions/$questionId/answer/$testType",
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

  @override
  Future<void> getAnsListenNComplete({
    required int courseId,
    required int questionId,
    required String answer,
    required String testType,
  }) async {
    try {
      final response = await dioClient.post(
        "${ApiUrls.ansFinalListenNComplete}$courseId/questions/$questionId/answer/$testType",
        data: {'answer': answer},
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
  Future<BuyCourseModel> getBuyCourse({required int courseId}) async {
    try {
      final response = await dioClient.post(
        ApiUrls.buyACourse,
        data: {'course_id': courseId},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return BuyCourseModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  /// ================
  @override
  Future<void> getAnsFinalFillInTheBlank({
    required int courseId,
    required int questionId,
    required String testType,
    required List<int> answerIds,
  }) async {
    try {
      final response = await dioClient.post(
        "${ApiUrls.ansFinalFillInTheBlank}$courseId/questions/$questionId/answer/$testType",
        data: {"answer_ids": answerIds},
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
  Future<void> getAnsFinalListenNCompleteWords({
    required int courseId,
    required int questionId,
    required String testType,
    required List<int> answerIds,
  }) async {
    try {
      final response = await dioClient.post(
        "${ApiUrls.ansFinalListenNCompleteWords}$courseId/questions/$questionId/answer/$testType",
        data: {"answer_ids": answerIds},
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
  Future<void> getAnsFinalMultipleChoiceWithPictures({
    required int courseId,
    required int questionId,
    required int answerId,
    required String testType,
  }) async {
    try {
      final response = await dioClient.post(
        "${ApiUrls.ansFinalMultipleChoiceWithPictures}$courseId/questions/$questionId/answer/$testType",
        data: {"answer_id": answerId},
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
  Future<void> getAnsSelectPairs({
    required int courseId,
    required int questionId,
    required int answerId,
    required String testType,
    required String pairText,
  }) async {
    try {
      final response = await dioClient.post(
        "${ApiUrls.ansFinalSelectPairs}$courseId/questions/$questionId/answer/$testType",
        data: {
          "answers": [
            {"id": answerId, "pair_text": pairText},
          ],
        },
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
  Future<FillInTheBlankEntity> getFinalFillInTheBlank({
    required int courseId,
    required int questionId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.finalTestResponse}$courseId/questions/$questionId/show",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return FillInTheBlankModel.fromJson(response.data['data']);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  @override
  Future<ListenNCompleteEntity> getFinalListenNComplete({
    required int courseId,
    required int questionId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.finalTestResponse}$courseId/questions/$questionId/show",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return ListenNCompleteModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  @override
  Future<ListenNCompleteWordsEntity> getFinalListenNCompleteWords({
    required int courseId,
    required int questionId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.finalTestResponse}$courseId/questions/$questionId/show",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return ListenNCompleteWordsModel.fromJson(response.data['data']);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  @override
  Future<ListenNSelectPairsModel> getFinalListenNSelectPairs({
    required int courseId,
    required int questionId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.finalTestResponse}$courseId/questions/$questionId/show",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return ListenNSelectPairsModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  @override
  Future<MultipleChoiceWithPicturesEntity> getFinalMultipleChoiceWithPictures({
    required int courseId,
    required int questionId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.finalTestResponse}$courseId/questions/$questionId/show",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return MultipleChoiceWithPicturesModel.fromJson(response.data['data']);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  @override
  Future<SelectPairResponseModel> getFinalSelectPairs({
    required int courseId,
    required int questionId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.finalTestResponse}$courseId/questions/$questionId/show",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
        return SelectPairResponseModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }

  @override
  Future<void> getRateCourse({
    required int courseId,
    required double stars,
    required String comment,
  }) async {
    try {
      final response = await dioClient.post(
        "${ApiUrls.rateACourse}$courseId/rate",
        data: {'stars': stars, 'comment': comment},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success! ${response.data}');
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e('Error $e');
    }
  }

  @override
  Future<void> getFaceRecognitionMyId({
    required String code,
    required File image,
  }) async {
    try {
      final formData = FormData.fromMap({
        "code": code,
        "image": await MultipartFile.fromFile(
          image.path,
          filename: "myid_image.jpg",
        ),
      });

      final response = await dioClient.post(
        ApiUrls.faceRecognitionMyId,
        data: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('✅ Success: ${response.data}');
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("❌ Error: $e");
    }
  }

  @override
  Future<void> getFaceRecognitionCompare({required File image}) async {
    try {
      final response = await dioClient.post(
        ApiUrls.faceRecognitionCompare,
        data: {"image": image},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success: ${response.data}');
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e("Error: $e");
    }
  }
}
