import 'package:skills_xorijdaish/core/common/constants/api_urls.dart';
import 'package:skills_xorijdaish/core/netwrok/dio_client.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/features/reels/data/model/reels_response.dart';
import 'package:skills_xorijdaish/features/reels/data/source/reels_data_source.dart';

class ReelsDataSourceImpl implements ReelsDataSource {
  final DioClient dioClient = DioClient();

  @override
  Future<ReelsResponseModel> getReels({required int page}) async {
    try {
      final response = await dioClient.get("${ApiUrls.reels}?page=$page");

      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i(
          'Successfully fetched reels page $page! ${response.statusCode}',
        );
        return ReelsResponseModel.fromJson(response.data);
      } else {
        throw Exception('Could not get reels: ${response.data}');
      }
    } catch (e) {
      logger.e('Error occurred while getting reels! $e');
      rethrow;
    }
  }

  @override
  Future<void> sendReelId({required int reelId}) async {
    try {
      final response = await dioClient.post("${ApiUrls.reelsLike}$reelId/like");
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.data['ok'] == true) {
        logger.i('Liked!');
      } else {
        throw Exception('Could not liked! ${response.statusCode}');
      }
    } catch (e) {
      logger.e('Error occured while liking the vid: $e');
      rethrow;
    }
  }
}
