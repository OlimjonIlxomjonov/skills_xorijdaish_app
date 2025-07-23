import 'package:skills_xorijdaish/features/statistics/domain/entity/avrage/average_response.dart';
import 'package:skills_xorijdaish/features/statistics/domain/repository/stats_repository.dart';

class AverageUseCase {
  final StatsRepository repository;

  AverageUseCase(this.repository);

  Future<AverageResponse> call() {
    return repository.fetchAverageTime();
  }
}
