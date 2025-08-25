import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class AnswerListenNCompleteUseCase {
  final CoursesRepository repository;

  AnswerListenNCompleteUseCase(this.repository);

  Future<void> call({
    required int courseId,
    required int questionId,
    required int lessonId,
    required String testType,
    required String answer,
  }) {
    return repository.answerListenNComplete(
      courseId: courseId,
      questionId: questionId,
      testType: testType,
      answer: answer,
      lessonId: lessonId,
    );
  }
}
