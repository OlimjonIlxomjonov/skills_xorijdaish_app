import 'package:skills_xorijdaish/features/statistics/domain/entity/weekly/week_entity.dart';

class WeekModel extends WeekEntity {
  WeekModel({
    required super.date,
    required super.activeTimesInSeconds,
    required super.weekday,
    required super.activeTimesInHumanReadable,
  });

  factory WeekModel.fromJson(Map<String, dynamic> json) {
    return WeekModel(
      date: json['date'],
      activeTimesInSeconds: json['active_times_in_seconds'],
      weekday: json['weekday'] ?? 1,
      activeTimesInHumanReadable: json['active_times_in_human_readable'],
    );
  }
}
