import 'package:skills_xorijdaish/features/statistics/domain/entity/weekly/week_response.dart';
import 'package:skills_xorijdaish/features/statistics/domain/repository/stats_repository.dart';

class WeekUseCase {
  final StatsRepository repository;

  WeekUseCase(this.repository);

  Future<WeekResponse> call() {
    return repository.fetchWeekly();
  }
}
