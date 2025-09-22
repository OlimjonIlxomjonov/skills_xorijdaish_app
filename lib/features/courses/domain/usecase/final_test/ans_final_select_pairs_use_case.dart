import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class AnsFinalSelectPairsUseCase {
  final CoursesRepository repository;

  AnsFinalSelectPairsUseCase(this.repository);

  Future<void> call({
    required int courseId,
    required int questionId,
    required int answerId,
    required String testType,
    required String pairText,
  }) {
    return repository.answerFinalSelectPairs(
      courseId: courseId,
      questionId: questionId,
      testType: testType,
      answerId: answerId,
      pairText: pairText,
    );
  }
}
