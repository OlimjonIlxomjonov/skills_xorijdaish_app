import 'dart:io';

import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/skill_test/skill_test_model.dart';
import 'package:skills_xorijdaish/features/courses/data/source/courses_remote_datasource_impl.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/buy_course/buy_course_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/foreign_language/foreign_language_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/pre_trip_courses/pre_trip_response.dart';
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
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_select_pairs/pair_text_option_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_select_pairs/select_pair_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lessons/lessons_by_id/lessons_by_id_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lessons/lessons_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/my_courses/my_courses_response.dart';
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
  Future<PreTripResponse> fetchPreTripCourses({required String query}) {
    return datasource.getPreTripCourses(query: query);
  }

  @override
  Future<LessonsResponse> fetchLessons({
    required int courseId,
    required int page,
  }) {
    return datasource.getLessons(courseId: courseId, page: page);
  }

  @override
  Future<VideoEntity> fetchVideo({
    required int courseId,
    required int lessonsId,
  }) {
    return datasource.getVideo(courseId: courseId, lessonsId: lessonsId);
  }

  @override
  Future<FileEntity> fetchFiles({
    required int courseId,
    required int lessonId,
  }) {
    return datasource.getFiles(courseId: courseId, lessonsId: lessonId);
  }

  @override
  Future<SkillTestModel> fetchSkillTest({required String query}) {
    return datasource.getSkillTest(query: query);
  }

  @override
  Future<CourseByIdEntity> fetchCourseById({required int courseId}) {
    return datasource.getCoursesById(courseId: courseId);
  }

  @override
  Future<MyCoursesResponse> fetchMyCourses() {
    return datasource.getMyCourse();
  }

  @override
  Future<LessonTestsResponse> fetchALlTest({
    required int courseId,
    required int lessonId,
  }) {
    return datasource.getLessonTests(courseId: courseId, lessonId: lessonId);
  }

  @override
  Future<TestByIdResponse> fetchTestById({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) {
    return datasource.getTestById(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
    );
  }

  @override
  Future<void> startALesson({required int courseId}) {
    return datasource.startACourse(courseId: courseId);
  }

  @override
  Future<void> answerToTest({
    required int courseId,
    required int lessonId,
    required int questionId,
    required String testType,
    required int answerId,
  }) {
    return datasource.getAnswerTest(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
      testType: testType,
      answerId: answerId,
    );
  }

  @override
  Future<SelectPairResponse> fetchSelectPairsTest({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) {
    return datasource.getSelectPairs(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
    );
  }

  @override
  Future<void> selectPairsAnswer({
    required int courseId,
    required int lessonId,
    required int questionId,
    required String testType,
    required int answerId,
    required String pairText,
  }) {
    return datasource.getAnswerSelectPairs(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
      testType: testType,
      answerId: answerId,
      pairText: pairText,
    );
  }

  @override
  Future<FinishTestEntity> fetchFinishTest({
    required int courseId,
    required int lessonId,
  }) {
    return datasource.getFinishTest(courseId: courseId, lessonId: lessonId);
  }

  @override
  Future<LessonTestsResponse> fetchFinalTestCourse({required int courseId}) {
    return datasource.getFinalTestCourse(courseId: courseId);
  }

  @override
  Future<TestByIdResponse> fetchFinalTestById({
    required int courseId,
    required int questionId,
  }) {
    return datasource.getFinalTestById(
      courseId: courseId,
      questionId: questionId,
    );
  }

  @override
  Future<ListenNCompleteEntity> fetchListenNComplete({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) {
    return datasource.getListenNComplete(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
    );
  }

  @override
  Future<void> answerListenNComplete({
    required int courseId,
    required int lessonId,
    required int questionId,
    required String testType,
    required String answer,
  }) {
    return datasource.getAnswerListenNComplete(
      courseId: courseId,
      questionId: questionId,
      testType: testType,
      answer: answer,
      lessonId: lessonId,
    );
  }

  @override
  Future<PreTripResponse> fetchPreTripByCountry({required int countryId}) {
    return datasource.getPreTripByCountry(countryId: countryId);
  }

  @override
  Future<void> setVideoTime({
    required int courseId,
    required int lessonId,
    required int time,
    required bool isWatched,
  }) {
    return datasource.setVideoTime(
      courseId: courseId,
      lessonId: lessonId,
      time: time,
      isWatched: isWatched,
    );
  }

  @override
  Future<FillInTheBlankEntity> fetchFillInTheBlank({
    required int courseId,
    required int lessonId,
    required questionId,
  }) {
    return datasource.getFillInTheBlankModel(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
    );
  }

  @override
  Future<ListenNCompleteWordsEntity> fetchListenNCompleteWords({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) {
    return datasource.getListenNCompleteWords(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
    );
  }

  @override
  Future<MultipleChoiceWithPicturesEntity> fetchMultipleChoiceWithPictures({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) {
    return datasource.getMultipleChoiceWithPictures(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
    );
  }

  @override
  Future<void> answerFillInTheBlank({
    required int courseId,
    required int lessonId,
    required int questionId,
    required String testType,
    required List<int> answerIds,
  }) {
    return datasource.getAnswerFillInTheBlank(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
      testType: testType,
      answerIds: answerIds,
    );
  }

  @override
  Future<ListenNSelectPairsEntity> fetchListenNSelectPairs({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) {
    return datasource.getListenNSelectPairs(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
    );
  }

  @override
  Future<LessonsByIdEntity> fetchLessonById({
    required int courseId,
    required int lessonId,
  }) {
    return datasource.getLessonById(courseId: courseId, lessonId: lessonId);
  }

  @override
  Future<FinishFinalTestResponse> fetchFinalTest({required int courseId}) {
    return datasource.getFinishFinalTest(courseId: courseId);
  }

  @override
  Future<void> answerFinalListenNComplete({
    required int courseId,
    required int questionId,
    required String answer,
    required String testType,
  }) {
    return datasource.getAnsListenNComplete(
      courseId: courseId,
      questionId: questionId,
      answer: answer,
      testType: testType,
    );
  }

  @override
  Future<void> answerFinalMultipleChoice({
    required int courseId,
    required int questionId,
    required int answerId,
    required String testType,
  }) {
    return datasource.getAnsFinalMultipleChoice(
      courseId: courseId,
      questionId: questionId,
      answerId: answerId,
      testType: testType,
    );
  }

  @override
  Future<BuyCourseEntity> buyACourse({required int courseId}) {
    return datasource.getBuyCourse(courseId: courseId);
  }

  @override
  Future<void> answerFinalFillInTheBlank({
    required int courseId,
    required int questionId,
    required String testType,
    required List<int> answersId,
  }) {
    return datasource.getAnsFinalFillInTheBlank(
      courseId: courseId,
      questionId: questionId,
      testType: testType,
      answerIds: answersId,
    );
  }

  @override
  Future<void> answerFinalListenNCompleteWords({
    required int courseId,
    required int questionId,
    required String testType,
    required List<int> answersId,
  }) {
    return datasource.getAnsFinalListenNCompleteWords(
      courseId: courseId,
      questionId: questionId,
      testType: testType,
      answerIds: answersId,
    );
  }

  @override
  Future<void> answerFinalMultipleChoiceWithPictures({
    required int courseId,
    required int questionId,
    required String testType,
    required int answerId,
  }) {
    return datasource.getAnsFinalMultipleChoiceWithPictures(
      courseId: courseId,
      questionId: questionId,
      answerId: answerId,
      testType: testType,
    );
  }

  @override
  Future<void> answerFinalSelectPairs({
    required int courseId,
    required int questionId,
    required String testType,
    required int answerId,
    required String pairText,
  }) {
    return datasource.getAnsSelectPairs(
      courseId: courseId,
      questionId: questionId,
      answerId: answerId,
      testType: testType,
      pairText: pairText,
    );
  }

  @override
  Future<FillInTheBlankEntity> fetchFinalFillInTheBlank({
    required int courseId,
    required int questionId,
  }) {
    return datasource.getFinalFillInTheBlank(
      courseId: courseId,
      questionId: questionId,
    );
  }

  @override
  Future<ListenNCompleteEntity> fetchFinalListenNComplete({
    required int courseId,
    required int questionId,
  }) {
    return datasource.getFinalListenNComplete(
      courseId: courseId,
      questionId: questionId,
    );
  }

  @override
  Future<ListenNCompleteWordsEntity> fetchFinalListenNCompleteWords({
    required int courseId,
    required int questionId,
  }) {
    return datasource.getFinalListenNCompleteWords(
      courseId: courseId,
      questionId: questionId,
    );
  }

  @override
  Future<ListenNSelectPairsEntity> fetchFinalListenNSelectPairs({
    required int courseId,
    required int questionId,
  }) {
    return datasource.getFinalListenNSelectPairs(
      courseId: courseId,
      questionId: questionId,
    );
  }

  @override
  Future<MultipleChoiceWithPicturesEntity>
  fetchFinalMultipleChoiceWithPictures({
    required int courseId,
    required int questionId,
  }) {
    return datasource.getFinalMultipleChoiceWithPictures(
      courseId: courseId,
      questionId: questionId,
    );
  }

  @override
  Future<SelectPairResponse> fetchFinalSelectPairs({
    required int courseId,
    required int questionId,
  }) {
    return datasource.getFinalSelectPairs(
      courseId: courseId,
      questionId: questionId,
    );
  }

  @override
  Future<void> rateACourse({
    required int courseId,
    required double stars,
    required String comment,
  }) {
    return datasource.getRateCourse(
      courseId: courseId,
      stars: stars,
      comment: comment,
    );
  }

  @override
  Future<void> faceRecognitionMyId({
    required String code,
    required File image,
  }) {
    return datasource.getFaceRecognitionMyId(code: code, image: image);
  }

  @override
  Future<void> faceRecognitionCompare({required File image}) {
    return datasource.getFaceRecognitionCompare(image: image);
  }
}
