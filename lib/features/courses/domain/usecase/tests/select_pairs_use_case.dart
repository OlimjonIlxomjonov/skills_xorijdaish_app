import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_select_pairs/select_pair_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class SelectPairsUseCase {
  final CoursesRepository repository;

  SelectPairsUseCase(this.repository);

  Future<SelectPairResponse> call({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) {
    return repository.fetchSelectPairsTest(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
    );
  }
}
