import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class AnswerToTestUseCase {
  final CoursesRepository repository;

  AnswerToTestUseCase(this.repository);

  Future<void> call({
    required int courseId,
    required int lessonId,
    required int questionId,
    required String testType,
    required int answerId,
  }) {
    return repository.answerToTest(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
      testType: testType,
      answerId: answerId,
    );
  }
}
