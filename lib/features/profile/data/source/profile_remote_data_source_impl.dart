import 'package:skills_xorijdaish/core/common/constants/api_urls.dart';
import 'package:skills_xorijdaish/core/netwrok/dio_client.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/features/profile/data/model/self_profile_model.dart';
import 'package:skills_xorijdaish/features/profile/data/source/profile_remote_data_source.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final DioClient dioClient = DioClient();

  @override
  Future<SelfProfileModel> getSelfInfo() async {
    try {
      final response = await dioClient.get(ApiUrls.selfInfo);
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Successfully fetched self info ${response.statusCode}');
        return SelfProfileModel.fromJson(response.data);
      } else {
        throw Exception('Error Self Profile ${response.data}');
      }
    } catch (e) {
      logger.e('Error catch $e');
      rethrow;
    }
  }
}
