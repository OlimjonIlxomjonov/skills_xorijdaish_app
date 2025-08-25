import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class RateCourseUseCase {
  final CoursesRepository repository;

  RateCourseUseCase(this.repository);

  Future<void> call({
    required int courseId,
    required double stars,
    required String comment,
  }) {
    return repository.rateACourse(
      courseId: courseId,
      stars: stars,
      comment: comment,
    );
  }
}
