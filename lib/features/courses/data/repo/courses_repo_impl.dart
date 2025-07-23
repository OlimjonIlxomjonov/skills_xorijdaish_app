import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/skill_test/skill_test_model.dart';
import 'package:skills_xorijdaish/features/courses/data/source/courses_remote_datasource_impl.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/foreign_language/foreign_language_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/pre_trip_courses/pre_trip_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/skill_test/skill_test_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/soft_skills/soft_skills_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/courses/courses_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/get_courses_by_id/course_by_id_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/get_files/file_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/get_video/video_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/lesson_tests_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_by_id/test_by_id_response.dart';
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
  Future<LessonsResponse> fetchLessons({required int courseId}) {
    return datasource.getLessons(courseId: courseId);
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
}
