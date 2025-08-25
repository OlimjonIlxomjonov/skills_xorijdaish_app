import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class AnswerFinalMultipleChoiceUseCase {
  final CoursesRepository repository;

  AnswerFinalMultipleChoiceUseCase(this.repository);

  Future<void> call({
    required int courseId,
    required int questionId,
    required int answerId,
    required String testType,
  }) {
    return repository.answerFinalMultipleChoice(
      courseId: courseId,
      questionId: questionId,
      answerId: answerId,
      testType: testType,
    );
  }
}
