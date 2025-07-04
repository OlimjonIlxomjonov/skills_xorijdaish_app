import 'courses_data_entity.dart';

class CourseStatsResponse {
  final bool ok;
  final CourseData data;

  CourseStatsResponse({required this.ok, required this.data});
}
