import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/buy_course/buy_course_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class BuyCourseUseCase {
  final CoursesRepository repository;

  BuyCourseUseCase(this.repository);

  Future<BuyCourseEntity> call({required int courseId}) {
    return repository.buyACourse(courseId: courseId);
  }
}
