import 'package:skills_xorijdaish/core/common/constants/api_urls.dart';
import 'package:skills_xorijdaish/core/netwrok/dio_client.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/features/statistics/data/model/average/average_response_model.dart';
import 'package:skills_xorijdaish/features/statistics/data/model/course/course_time_response_model.dart';
import 'package:skills_xorijdaish/features/statistics/data/model/weekly/week_response_model.dart';
import 'package:skills_xorijdaish/features/statistics/data/source/stats_remote_data_source.dart';

class StatsRemoteDataSourceImpl implements StatsRemoteDataSource {
  final DioClient dioClient = DioClient();

  @override
  Future<AverageResponseModel> getAverageTime() async {
    try {
      final response = await dioClient.get(ApiUrls.averageTime);
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success: ${response.data}');
        return AverageResponseModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e('Error: $e');
      rethrow;
    }
  }

  @override
  Future<WeekResponseModel> getWeekly() async {
    try {
      final response = await dioClient.get(ApiUrls.weekly);
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success: ${response.data}');
        return WeekResponseModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e('Error: $e');
      rethrow;
    }
  }

  @override
  Future<CourseTimeResponseModel> getCourseTime({
    required DateTime date,
  }) async {
    try {
      final response = await dioClient.get("${ApiUrls.courseTime}$date");
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success: ${response.data}');
        return CourseTimeResponseModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e('Error: $e');
      rethrow;
    }
  }
}
