import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/lesson_tests_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class FinalTestCourseUseCase {
  final CoursesRepository repository;

  FinalTestCourseUseCase(this.repository);

  Future<LessonTestsResponse> call({required int courseId}) {
    return repository.fetchFinalTestCourse(courseId: courseId);
  }
}
