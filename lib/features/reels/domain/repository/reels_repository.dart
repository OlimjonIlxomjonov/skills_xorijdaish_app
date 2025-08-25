import '../entity/reels_response.dart';

abstract class ReelsRepository {
  Future<ReelsResponse> fetchAllReels({required int page});

  Future<void> postALike({required int reelId});
}
