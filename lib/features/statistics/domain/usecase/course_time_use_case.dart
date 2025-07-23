import 'package:skills_xorijdaish/features/statistics/domain/entity/course/course_time_response.dart';
import 'package:skills_xorijdaish/features/statistics/domain/repository/stats_repository.dart';

class CourseTimeUseCase {
  final StatsRepository repository;

  CourseTimeUseCase(this.repository);

  Future<CourseTimeResponse> call({required DateTime date}) {
    return repository.fetchCourseTimes(date: date);
  }
}
