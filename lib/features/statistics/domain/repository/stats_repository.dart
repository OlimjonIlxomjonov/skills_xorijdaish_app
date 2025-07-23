import 'package:skills_xorijdaish/features/statistics/domain/entity/avrage/average_response.dart';
import 'package:skills_xorijdaish/features/statistics/domain/entity/course/course_time_response.dart';
import 'package:skills_xorijdaish/features/statistics/domain/entity/weekly/week_response.dart';

abstract class StatsRepository {
  Future<AverageResponse> fetchAverageTime();

  Future<WeekResponse> fetchWeekly();

  Future<CourseTimeResponse> fetchCourseTimes({required DateTime date});
}
