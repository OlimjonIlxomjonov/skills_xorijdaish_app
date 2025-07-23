import 'package:skills_xorijdaish/features/reels/domain/entity/reels_response.dart';

import '../../domain/repository/reels_repository.dart';
import '../source/reels_data_source.dart';

class ReelsRepoImpl extends ReelsRepository {
  final ReelsDataSource dataSource;

  ReelsRepoImpl(this.dataSource);

  @override
  Future<ReelsResponse> fetchAllReels() {
    return dataSource.getReels();
  }

  @override
  Future<void> postALike({required int reelId}) {
    return dataSource.sendReelId(reelId: reelId);
  }
}
