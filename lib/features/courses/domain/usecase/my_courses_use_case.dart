import 'package:skills_xorijdaish/features/courses/domain/entities/my_courses/my_courses_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class MyCoursesUseCase {
  final CoursesRepository repository;

  MyCoursesUseCase(this.repository);

  Future<MyCoursesResponse> call() {
    return repository.fetchMyCourses();
  }
}
