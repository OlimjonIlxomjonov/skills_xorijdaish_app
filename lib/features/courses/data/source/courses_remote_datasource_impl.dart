import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/foreign_language/foreign_language_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/pre_trip_courses/pre_trip_response.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/skill_test/skill_test_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/skill_test/skill_test_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/soft_skills/soft_skills_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/countries_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/courses/courses_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/courses_by_id_model/courses_by_id_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/get_video/video_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons/lesson_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/lesson_test_response_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/my_courses/my_course_response_model.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_by_id/test_by_id_response.dart';

import '../models/get_files/file_model.dart';
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
}
