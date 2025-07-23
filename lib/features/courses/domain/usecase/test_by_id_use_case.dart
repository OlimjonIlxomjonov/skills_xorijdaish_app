import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_by_id/test_by_id_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class TestByIdUseCase {
  final CoursesRepository repository;

  TestByIdUseCase(this.repository);

  Future<TestByIdResponse> call({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) {
    return repository.fetchTestById(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
    );
  }
}
