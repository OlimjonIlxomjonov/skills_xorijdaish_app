import 'package:skills_xorijdaish/features/statistics/domain/entity/weekly/week_entity.dart';

class WeekResponse {
  final bool ok;
  final List<WeekEntity> data;

  WeekResponse({required this.ok, required this.data});
}
