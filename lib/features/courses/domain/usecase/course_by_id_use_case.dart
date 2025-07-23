import 'package:skills_xorijdaish/features/courses/domain/entities/get_courses_by_id/course_by_id_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class CourseByIdUseCase {
  final CoursesRepository repository;

  CourseByIdUseCase(this.repository);

  Future<CourseByIdEntity> call({required int courseId}) {
    return repository.fetchCourseById(courseId: courseId);
  }
}
