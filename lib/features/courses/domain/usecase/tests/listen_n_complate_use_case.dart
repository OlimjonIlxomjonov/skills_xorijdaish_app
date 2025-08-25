import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_and_complate/listen_n_complate.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class ListenNCompleteUseCase {
  final CoursesRepository repository;

  ListenNCompleteUseCase(this.repository);

  Future<ListenNCompleteEntity> call({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) {
    return repository.fetchListenNComplete(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
    );
  }
}
