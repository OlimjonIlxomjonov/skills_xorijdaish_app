import 'package:skills_xorijdaish/features/courses/domain/entities/courses/courses_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class CoursesCardUseCase {
  final CoursesRepository repository;

  CoursesCardUseCase(this.repository);

  Future<CourseStatsResponse> call() {
    return repository.fetchAllCourses();
  }
}
