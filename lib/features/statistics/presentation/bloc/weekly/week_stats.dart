import 'package:skills_xorijdaish/features/statistics/domain/entity/weekly/week_response.dart';

class WeekStats {
  WeekStats();
}

class WeekStatsInitial extends WeekStats {}

class WeekStatsLoading extends WeekStats {}

class WeekStatsLoaded extends WeekStats {
  final WeekResponse response;

  WeekStatsLoaded(this.response);
}

class WeekStatsError extends WeekStats {
  final String message;

  WeekStatsError(this.message);
}
