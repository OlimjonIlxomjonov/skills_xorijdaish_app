import 'package:skills_xorijdaish/features/reels/data/model/reels_response.dart';

abstract class ReelsDataSource {
  Future<ReelsResponseModel> getReels();

  Future<void> sendReelId({required int reelId});
}
