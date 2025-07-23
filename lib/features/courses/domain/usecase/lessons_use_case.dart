import 'package:skills_xorijdaish/features/courses/domain/entities/lessons/lessons_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class LessonsUseCase {
  final CoursesRepository repository;

  LessonsUseCase(this.repository);

  Future<LessonsResponse> call({required int courseId}) {
    return repository.fetchLessons(courseId: courseId);
  }
}
