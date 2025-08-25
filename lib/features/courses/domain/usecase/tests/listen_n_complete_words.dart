import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_n_complete_words/listen_n_complete_words_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class ListenNCompleteWordsUseCase {
  final CoursesRepository repository;

  ListenNCompleteWordsUseCase(this.repository);

  Future<ListenNCompleteWordsEntity> call({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) {
    return repository.fetchListenNCompleteWords(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
    );
  }
}
