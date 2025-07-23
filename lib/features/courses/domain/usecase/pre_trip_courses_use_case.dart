import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/pre_trip_courses/pre_trip_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class PreTripCoursesUseCase {
  final CoursesRepository repository;

  PreTripCoursesUseCase(this.repository);

  Future<PreTripResponse> call({required String query}) {
    return repository.fetchPreTripCourses(query: query);
  }
}
