import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/fill_in_the_blank/fill_in_the_blank_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class FillInTheBlankUseCase {
  final CoursesRepository repository;

  FillInTheBlankUseCase(this.repository);

  Future<FillInTheBlankEntity> call({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) {
    return repository.fetchFillInTheBlank(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
    );
  }
}
