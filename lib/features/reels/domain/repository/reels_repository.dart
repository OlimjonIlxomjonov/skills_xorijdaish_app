import '../entity/reels_response.dart';

abstract class ReelsRepository {
  Future<ReelsResponse> fetchAllReels();
}
