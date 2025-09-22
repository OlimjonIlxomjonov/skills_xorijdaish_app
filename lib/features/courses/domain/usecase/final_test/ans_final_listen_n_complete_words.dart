import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class AnsFinalListenNCompleteWordsUseCase {
  final CoursesRepository repository;

  AnsFinalListenNCompleteWordsUseCase(this.repository);

  Future<void> call({
    required int courseId,
    required int questionId,
    required String testType,
    required List<int> answerIds,
  }) {
    return repository.answerFinalListenNCompleteWords(
      courseId: courseId,
      questionId: questionId,
      testType: testType,
      answersId: answerIds,
    );
  }
}
