import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/multiple_choice_with_pictures/multiple_choice_with_pictures.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class MultipleChoiceWithPicturesUseCase {
  final CoursesRepository repository;

  MultipleChoiceWithPicturesUseCase(this.repository);

  Future<MultipleChoiceWithPicturesEntity> call({
    required int courseId,
    required int lessonId,
    required int questionId,
  }) {
    return repository.fetchMultipleChoiceWithPictures(
      courseId: courseId,
      lessonId: lessonId,
      questionId: questionId,
    );
  }
}
