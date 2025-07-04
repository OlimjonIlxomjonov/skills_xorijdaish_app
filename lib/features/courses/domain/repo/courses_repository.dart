import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/all_courses_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/courses/courses_response.dart';

import '../entities/countries_entity.dart';

abstract class CoursesRepository {
  Future<List<CountryEnt>> fetchAllCounties();

  Future<CourseStatsResponse> fetchAllCourses();

  // Future<AllCoursesResponse> fetchLessonsCourses();
}
