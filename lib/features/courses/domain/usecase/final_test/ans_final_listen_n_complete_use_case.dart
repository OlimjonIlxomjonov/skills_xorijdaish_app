import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class AnsFinalListenNComplete {
  final CoursesRepository repository;

  AnsFinalListenNComplete(this.repository);

  Future<void> call({
    required int courseId,
    required int questionId,
    required String answer,
    required String testType,
  }) {
    return repository.answerFinalListenNComplete(
      courseId: courseId,
      questionId: questionId,
      answer: answer,
      testType: testType,
    );
  }
}
