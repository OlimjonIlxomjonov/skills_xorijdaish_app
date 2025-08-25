import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class AnswerFillInTheBlankUseCase {
  final CoursesRepository repository;

  AnswerFillInTheBlankUseCase(this.repository);

  Future<void> call({
    required int courseId,
    required int lessonId,
    required int questionId,
    required String testType,
    required List<int> answerIds,
  }) {
    return repository.answerFillInTheBlank(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
      testType: testType,
      answerIds: answerIds,
    );
  }
}
