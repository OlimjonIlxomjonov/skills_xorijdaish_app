import 'package:skills_xorijdaish/features/reels/domain/repository/reels_repository.dart';

class PostReelsLikeUseCase {
  final ReelsRepository repository;

  PostReelsLikeUseCase(this.repository);

  Future<void> call({required int reelId}) {
    return repository.postALike(reelId: reelId);
  }
}
