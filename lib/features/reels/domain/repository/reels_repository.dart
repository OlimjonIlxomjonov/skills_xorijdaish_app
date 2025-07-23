import '../entity/reels_response.dart';

abstract class ReelsRepository {
  Future<ReelsResponse> fetchAllReels();
  Future<void> postALike({required int reelId});
}
