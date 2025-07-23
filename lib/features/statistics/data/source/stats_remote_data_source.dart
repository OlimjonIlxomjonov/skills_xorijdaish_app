import 'package:skills_xorijdaish/features/statistics/data/model/average/average_response_model.dart';
import 'package:skills_xorijdaish/features/statistics/data/model/weekly/week_response_model.dart';
import '../model/course/course_time_response_model.dart';

abstract class StatsRemoteDataSource {
  Future<AverageResponseModel> getAverageTime();

  Future<WeekResponseModel> getWeekly();

  Future<CourseTimeResponseModel> getCourseTime({required DateTime date});
}
