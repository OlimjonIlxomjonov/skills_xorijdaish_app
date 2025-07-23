import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/foreign_language/foreign_language_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/pre_trip_courses/pre_trip_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/skill_test/skill_test_entity.dart';
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

import '../entities/countries_entity.dart';

abstract class CoursesRepository {
  Future<List<CountryEnt>> fetchAllCounties();

  Future<CourseStatsResponse> fetchAllCourses();

  Future<SoftSkillsResponse> fetchSoftSkills({required String query});

  Future<ForeignLanguageResponse> fetchForeignLanguage({required String query});

  Future<PreTripResponse> fetchPreTripCourses({required String query});

  Future<LessonsResponse> fetchLessons({required int courseId});

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

  Future<TestByIdResponse> fetchTestById({
    required int courseId,
    required int lessonId,
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
}
