import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class AnsFinalMultipleChoiceWithPicturesUseCase {
  final CoursesRepository repository;

  AnsFinalMultipleChoiceWithPicturesUseCase(this.repository);

  Future<void> call({
    required int courseId,
    required int questionId,
    required int answerId,
    required String testType,
  }) {
    return repository.answerFinalMultipleChoiceWithPictures(
      courseId: courseId,
      questionId: questionId,
      testType: testType,
      answerId: answerId,
    );
  }
}
