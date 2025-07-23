import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class StartCourseUseCase {
  final CoursesRepository repository;

  StartCourseUseCase(this.repository);

  Future<void> call({required int courseId}) {
    return repository.startALesson(courseId: courseId);
  }
}
