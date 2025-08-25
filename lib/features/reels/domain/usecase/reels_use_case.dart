import 'package:skills_xorijdaish/features/reels/domain/repository/reels_repository.dart';

import '../entity/reels_response.dart';

class ReelsUseCase {
  final ReelsRepository repository;

  ReelsUseCase(this.repository);

  Future<ReelsResponse> call({int page = 1}) {
    return repository.fetchAllReels(page: page);
  }
}
