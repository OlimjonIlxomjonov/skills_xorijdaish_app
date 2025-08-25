import 'package:skills_xorijdaish/features/home/domain/entities/banners/banners_response.dart';
import 'package:skills_xorijdaish/features/home/domain/repository/home_repository.dart';

class BannersUseCase {
  final HomeRepository repository;

  BannersUseCase(this.repository);

  Future<BannersResponse> call() {
    return repository.fetchBanners();
  }
}
