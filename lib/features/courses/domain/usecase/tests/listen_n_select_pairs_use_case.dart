import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_n_select_pairs/listen_n_select_pairs_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class ListenNSelectPairsUseCase {
  final CoursesRepository repository;

  ListenNSelectPairsUseCase(this.repository);

  Future<ListenNSelectPairsEntity> call({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) {
    return repository.fetchListenNSelectPairs(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
    );
  }
}
