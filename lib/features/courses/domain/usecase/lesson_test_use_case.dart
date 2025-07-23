import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/lesson_tests_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class LessonTestUseCase {
  final CoursesRepository repository;

  LessonTestUseCase(this.repository);

  Future<LessonTestsResponse> call({
    required int courseId,
    required int lessonId,
  }) {
    return repository.fetchALlTest(courseId: courseId, lessonId: lessonId);
  }
}
