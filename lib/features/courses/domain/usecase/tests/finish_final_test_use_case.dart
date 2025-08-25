import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/finish_final_test/finish_final_test_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class FinishFinalTestUseCase {
  final CoursesRepository repository;

  FinishFinalTestUseCase(this.repository);

  Future<FinishFinalTestResponse> call({required int courseId}) {
    return repository.fetchFinalTest(courseId: courseId);
  }
}
