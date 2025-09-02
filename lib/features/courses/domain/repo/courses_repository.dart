import 'dart:io';

import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/buy_course/buy_course_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/foreign_language/foreign_language_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/pre_trip_courses/pre_trip_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/skill_test/skill_test_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/soft_skills/soft_skills_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/courses/courses_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/get_courses_by_id/course_by_id_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/get_files/file_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/get_video/video_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/fill_in_the_blank/fill_in_the_blank_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/finish_final_test/finish_final_test_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/finish_test/finish_test_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/lesson_tests_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_and_complate/listen_n_complate.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_n_complete_words/listen_n_complete_words_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_n_select_pairs/listen_n_select_pairs_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/multiple_choice_with_pictures/multiple_choice_with_pictures.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_by_id/test_by_id_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lessons/lessons_by_id/lessons_by_id_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lessons/lessons_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/my_courses/my_courses_response.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/tests/questions/listen_n_select_pairs.dart';

import '../entities/countries_entity.dart';
import '../entities/lesson_tests/test_select_pairs/pair_text_option_entity.dart';
import '../entities/lesson_tests/test_select_pairs/select_pair_response.dart';

abstract class CoursesRepository {
  Future<List<CountryEnt>> fetchAllCounties();

  Future<CourseStatsResponse> fetchAllCourses();

  Future<SoftSkillsResponse> fetchSoftSkills({required String query});

  Future<ForeignLanguageResponse> fetchForeignLanguage({required String query});

  Future<PreTripResponse> fetchPreTripCourses({required String query});

  Future<LessonsResponse> fetchLessons({
    required int courseId,
    required int page,
  });

  Future<VideoEntity> fetchVideo({
    required int courseId,
    required int lessonsId,
  });

  Future<FileEntity> fetchFiles({required int courseId, required int lessonId});

  Future<SkillTestEntity> fetchSkillTest({required String query});

  Future<CourseByIdEntity> fetchCourseById({required int courseId});

  Future<MyCoursesResponse> fetchMyCourses();

  Future<LessonTestsResponse> fetchALlTest({
    required int courseId,
    required int lessonId,
  });

  // Tests & Final tests

  Future<TestByIdResponse> fetchTestById({
    required int courseId,
    required int lessonId,
    required int questionId,
  });

  Future<SelectPairResponse> fetchSelectPairsTest({
    required int courseId,
    required int lessonId,
    required int questionId,
  });

  Future<ListenNCompleteEntity> fetchListenNComplete({
    required int courseId,
    required int lessonId,
    required int questionId,
  });

  /// final tests
  Future<TestByIdResponse> fetchFinalTestById({
    // this is a multiple choice test type
    required int courseId,
    required int questionId,
  });

  Future<ListenNCompleteEntity> fetchFinalListenNComplete({
    required int courseId,
    required int questionId,
  });

  Future<FillInTheBlankEntity> fetchFinalFillInTheBlank({
    required int courseId,
    required int questionId,
  });

  Future<ListenNCompleteWordsEntity> fetchFinalListenNCompleteWords({
    required int courseId,
    required int questionId,
  });

  Future<SelectPairResponse> fetchFinalSelectPairs({
    required int courseId,
    required int questionId,
  });

  Future<MultipleChoiceWithPicturesEntity>
  fetchFinalMultipleChoiceWithPictures({
    required int courseId,
    required int questionId,
  });

  Future<ListenNSelectPairsEntity> fetchFinalListenNSelectPairs({
    required int courseId,
    required int questionId,
  });

  Future<void> startALesson({required int courseId});

  Future<void> answerToTest({
    required int courseId,
    required int lessonId,
    required int questionId,
    required String testType,
    required int answerId,
  });

  Future<void> selectPairsAnswer({
    required int courseId,
    required int lessonId,
    required int questionId,
    required String testType,
    required int answerId,
    required String pairText,
  });

  Future<FinishTestEntity> fetchFinishTest({
    required int courseId,
    required int lessonId,
  });

  Future<LessonTestsResponse> fetchFinalTestCourse({required int courseId});

  Future<void> answerListenNComplete({
    required int courseId,
    required int lessonId,
    required int questionId,
    required String testType,
    required String answer,
  });

  Future<PreTripResponse> fetchPreTripByCountry({required int countryId});

  Future<void> setVideoTime({
    required int courseId,
    required int lessonId,
    required int time,
    required bool isWatched,
  });

  Future<FillInTheBlankEntity> fetchFillInTheBlank({
    required int courseId,
    required int lessonId,
    required questionId,
  });

  Future<ListenNCompleteWordsEntity> fetchListenNCompleteWords({
    required int courseId,
    required int lessonId,
    required int questionId,
  });

  Future<MultipleChoiceWithPicturesEntity> fetchMultipleChoiceWithPictures({
    required int courseId,
    required int lessonId,
    required int questionId,
  });

  Future<ListenNSelectPairsEntity> fetchListenNSelectPairs({
    required int courseId,
    required int lessonId,
    required int questionId,
  });

  Future<void> answerFillInTheBlank({
    required int courseId,
    required int lessonId,
    required int questionId,
    required String testType,
    required List<int> answerIds,
  });

  Future<LessonsByIdEntity> fetchLessonById({
    required int courseId,
    required int lessonId,
  });

  Future<FinishFinalTestResponse> fetchFinalTest({required int courseId});

  /// Buy course
  Future<BuyCourseEntity> buyACourse({required int courseId});

  /// Final test post answers
  Future<void> answerFinalMultipleChoice({
    required int courseId,
    required int questionId,
    required int answerId,
    required String testType,
  });

  Future<void> answerFinalListenNComplete({
    required int courseId,
    required int questionId,
    required String answer,
    required String testType,
  });

  /// ===========
  Future<void> answerFinalFillInTheBlank({
    required int courseId,
    required int questionId,
    required String testType,
    required List<int> answersId,
  });

  Future<void> answerFinalListenNCompleteWords({
    required int courseId,
    required int questionId,
    required String testType,
    required List<int> answersId,
  });

  /// ==============
  Future<void> answerFinalMultipleChoiceWithPictures({
    required int courseId,
    required int questionId,
    required String testType,
    required int answerId,
  });

  Future<void> answerFinalSelectPairs({
    required int courseId,
    required int questionId,
    required String testType,
    required int answerId,
    required String pairText,
  });

  Future<void> rateACourse({
    required int courseId,
    required double stars,
    required String comment,
  });

  /// Face Recognition
  Future<void> faceRecognitionMyId({required String code, required File image});

  Future<void> faceRecognitionCompare({required File image});
}
