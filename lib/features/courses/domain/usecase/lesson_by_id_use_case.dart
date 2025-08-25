import 'package:skills_xorijdaish/features/courses/domain/entities/lessons/lessons_by_id/lessons_by_id_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class LessonsByIdUseCase {
  final CoursesRepository repository;

  LessonsByIdUseCase(this.repository);

  Future<LessonsByIdEntity> call({
    required int courseId,
    required int lessonId,
  }) {
    return repository.fetchLessonById(courseId: courseId, lessonId: lessonId);
  }
}
