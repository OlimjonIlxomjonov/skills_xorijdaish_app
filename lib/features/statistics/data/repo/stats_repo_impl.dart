import 'package:skills_xorijdaish/features/statistics/data/source/stats_remote_data_source.dart';
import 'package:skills_xorijdaish/features/statistics/domain/entity/avrage/average_response.dart';
import 'package:skills_xorijdaish/features/statistics/domain/entity/course/course_time_response.dart';
import 'package:skills_xorijdaish/features/statistics/domain/entity/weekly/week_response.dart';
import 'package:skills_xorijdaish/features/statistics/domain/repository/stats_repository.dart';

class StatsRepoImpl implements StatsRepository {
  final StatsRemoteDataSource remoteDataSource;

  StatsRepoImpl(this.remoteDataSource);

  @override
  Future<AverageResponse> fetchAverageTime() {
    return remoteDataSource.getAverageTime();
  }

  @override
  Future<WeekResponse> fetchWeekly() {
    return remoteDataSource.getWeekly();
  }

  @override
  Future<CourseTimeResponse> fetchCourseTimes({required DateTime date}) {
    return remoteDataSource.getCourseTime(date: date);
  }
}
