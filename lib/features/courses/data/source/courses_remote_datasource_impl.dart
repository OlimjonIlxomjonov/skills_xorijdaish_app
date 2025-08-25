import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/buy_course/buy_course_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/foreign_language/foreign_language_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/pre_trip_courses/pre_trip_response.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/skill_test/skill_test_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/soft_skills/soft_skills_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/countries_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/courses/courses_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/courses_by_id_model/courses_by_id_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/get_video/video_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons/lesson_by_id/lesson_by_id_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons/lesson_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/fill_in_the_blank/fill_in_the_blank_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/finish_final_test/finish_final_test_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/finish_test/finish_test_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/lesson_test_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/listen_n_complate/listen_n_complete_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/listen_n_select_pairs/listen_n_select_pairs_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/multiple_choice_with_pictures/multiple_choice_with_pictures_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/select_pairs/select_pair_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/my_courses/my_course_response_model.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_select_pairs/select_pair_response.dart';

import '../../domain/entities/lesson_tests/fill_in_the_blank/fill_in_the_blank_entity.dart';
import '../../domain/entities/lesson_tests/listen_and_complate/listen_n_complate.dart';
import '../../domain/entities/lesson_tests/listen_n_complete_words/listen_n_complete_words_entity.dart';
import '../../domain/entities/lesson_tests/listen_n_select_pairs/listen_n_select_pairs_entity.dart';
import '../../domain/entities/lesson_tests/multiple_choice_with_pictures/multiple_choice_with_pictures.dart';
import '../../domain/entities/lesson_tests/test_select_pairs/pair_text_option_entity.dart';
import '../models/get_files/file_model.dart';
import '../models/lessons_test/listen_n_completle_words/listen_n_complete_words_model.dart';
import '../models/lessons_test/test_by_id/test_by_id_response_model.dart';

abstract class CoursesRemoteDatasource {
  Future<List<CountryModel>> getAllCountry();

  Future<CoursesResponseModel> getAllCourses();

  Future<SoftSkillsResponseModel> getSoftSkills({required String query});

  Future<ForeignLanguageResponseModel> getForeignLanguage({
    required String query,
  });

  Future<PreTripResponseModel> getPreTripCourses({required String query});

  Future<LessonsResponseModel> getLessons({required int courseId});

  Future<VideoModel> getVideo({required int courseId, required int lessonsId});

  Future<FileModel> getFiles({required int courseId, required int lessonsId});

  Future<SkillTestModel> getSkillTest({required String query});

  Future<CoursesByIdModel> getCoursesById({required int courseId});

  Future<MyCourseResponseModel> getMyCourse();

  Future<LessonTestResponseModel> getLessonTests({
    required int courseId,
    required int lessonId,
  });

  Future<TestByIdResponseModel> getTestById({
    required int courseId,
    required int lessonId,
    required int questionId,
  });

  Future<void> startACourse({required int courseId});

  Future<void> getAnswerTest({
    required int courseId,
    required int lessonId,
    required int questionId,
    required String testType,
    required int answerId,
  });

  Future<SelectPairResponseModel> getSelectPairs({
    required int courseId,
    required int lessonId,
    required int questionId,
  });

  Future<void> getAnswerSelectPairs({
    required int courseId,
    required int lessonId,
    required int questionId,
    required String testType,
    required int answerId,
    required String pairText,
  });

  Future<FinishTestModel> getFinishTest({
    required int courseId,
    required int lessonId,
  });

  Future<LessonTestResponseModel> getFinalTestCourse({required int courseId});

  Future<TestByIdResponseModel> getFinalTestById({
    required int courseId,
    required int questionId,
  });

  Future<ListenNCompleteModel> getListenNComplete({
    required int courseId,
    required int lessonId,
    required int questionId,
  });

  Future<void> getAnswerListenNComplete({
    required int courseId,
    required int lessonId,
    required int questionId,
    required String testType,
    required String answer,
  });

  Future<PreTripResponseModel> getPreTripByCountry({required int countryId});

  Future<void> setVideoTime({
    required int courseId,
    required int lessonId,
    required int time,
    required bool isWatched,
  });

  Future<FillInTheBlankModel> getFillInTheBlankModel({
    required int courseId,
    required int lessonId,
    required int questionId,
  });

  Future<ListenNCompleteWordsModel> getListenNCompleteWords({
    required int courseId,
    required int lessonId,
    required int questionId,
  });

  Future<MultipleChoiceWithPicturesModel> getMultipleChoiceWithPictures({
    required int courseId,
    required int lessonId,
    required int questionId,
  });

  Future<void> getAnswerFillInTheBlank({
    required int courseId,
    required int lessonId,
    required int questionId,
    required String testType,
    required List<int> answerIds,
  });

  Future<ListenNSelectPairsModel> getListenNSelectPairs({
    required int courseId,
    required int lessonId,
    required int questionId,
  });

  Future<LessonByIdModel> getLessonById({
    required int courseId,
    required int lessonId,
  });

  Future<FinishFinalTestResponseModel> getFinishFinalTest({
    required int courseId,
  });

  Future<void> getAnsFinalMultipleChoice({
    required int courseId,
    required int questionId,
    required int answerId,
    required String testType,
  });

  Future<void> getAnsListenNComplete({
    required int courseId,
    required int questionId,
    required String answer,
    required String testType,
  });

  Future<BuyCourseModel> getBuyCourse({required int courseId});

  /// ===============
  Future<void> getAnsFinalFillInTheBlank({
    required int courseId,
    required int questionId,
    required String testType,
    required List<int> answerIds,
  });

  Future<void> getAnsFinalListenNCompleteWords({
    required int courseId,
    required int questionId,
    required String testType,
    required List<int> answerIds,
  });

  /// =============
  Future<void> getAnsFinalMultipleChoiceWithPictures({
    required int courseId,
    required int questionId,
    required int answerId,
    required String testType,
  });

  Future<void> getAnsSelectPairs({
    required int courseId,
    required int questionId,
    required int answerId,
    required String testType,
    required String pairText,
  });

  /// final tests
  Future<ListenNCompleteEntity> getFinalListenNComplete({
    required int courseId,
    required int questionId,
  });

  Future<FillInTheBlankEntity> getFinalFillInTheBlank({
    required int courseId,
    required int questionId,
  });

  Future<ListenNCompleteWordsEntity> getFinalListenNCompleteWords({
    required int courseId,
    required int questionId,
  });

  Future<SelectPairResponse> getFinalSelectPairs({
    required int courseId,
    required int questionId,
  });

  Future<MultipleChoiceWithPicturesEntity> getFinalMultipleChoiceWithPictures({
    required int courseId,
    required int questionId,
  });

  Future<ListenNSelectPairsEntity> getFinalListenNSelectPairs({
    required int courseId,
    required int questionId,
  });

  Future<void> getRateCourse({
    required int courseId,
    required double stars,
    required String comment,
  });
}
