import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_by_id/test_by_id_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class FinalTestByIdUseCase {
  final CoursesRepository repository;

  FinalTestByIdUseCase(this.repository);

  Future<TestByIdResponse> call({
    required int courseId,
    required int questionId,
  }) {
    return repository.fetchFinalTestById(
      courseId: courseId,
      questionId: questionId,
    );
  }
}
