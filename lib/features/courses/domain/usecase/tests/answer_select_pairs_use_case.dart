import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class AnswerSelectPairsUseCase {
  final CoursesRepository repository;

  AnswerSelectPairsUseCase(this.repository);

  Future<void> call({
    required int courseId,
    required int lessonId,
    required int questionId,
    required String testType,
    required int answerId,
    required String pairText,
  }) {
    return repository.selectPairsAnswer(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
      testType: testType,
      answerId: answerId,
      pairText: pairText,
    );
  }
}
