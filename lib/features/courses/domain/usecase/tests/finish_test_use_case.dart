import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/finish_test/finish_test_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class FinishTestUseCase {
  final CoursesRepository repository;

  FinishTestUseCase(this.repository);

  Future<FinishTestEntity> call({
    required int courseId,
    required int lessonId,
  }) {
    return repository.fetchFinishTest(courseId: courseId, lessonId: lessonId);
  }
}
