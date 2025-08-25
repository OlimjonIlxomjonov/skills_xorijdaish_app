import 'package:skills_xorijdaish/core/common/constants/api_urls.dart';
import 'package:skills_xorijdaish/core/netwrok/dio_client.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/features/home/data/models/banners/banners_response_model.dart';
import 'package:skills_xorijdaish/features/home/data/models/notification/notification_response_model.dart';
import 'package:skills_xorijdaish/features/home/data/models/notification/notifications_count_model.dart';
import 'package:skills_xorijdaish/features/home/data/models/search/search_response_model.dart';
import 'package:skills_xorijdaish/features/home/data/source/home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioClient dioClient = DioClient();

  @override
  Future<NotificationResponseModel> getNotifications({int page = 1}) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.notifications}?page=$page",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Succes: ${response.data}');
        return NotificationResponseModel.fromJson(response.data);
      } else {
        throw Exception(
          'Error: status code: ${response.statusCode}: ${response.data}',
        );
      }
    } catch (e) {
      logger.e('Error: $e');
      rethrow;
    }
  }

  @override
  Future<SearchResponseModel> getSearch({required String query}) async {
    try {
      final response = await dioClient.get("${ApiUrls.search}$query");
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Succes: ${response.data}');
        return SearchResponseModel.fromJson(response.data);
      } else {
        throw Exception(
          'Error: status code: ${response.statusCode}: ${response.data}',
        );
      }
    } catch (e) {
      logger.e('Error: $e');
      rethrow;
    }
  }

  @override
  Future<NotificationsCountModel> getNotificationsCount() async {
    try {
      final response = await dioClient.get(ApiUrls.notificationsCount);
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Succes: ${response.data}');
        return NotificationsCountModel.fromJson(response.data);
      } else {
        throw Exception(
          'Error: status code: ${response.statusCode}: ${response.data}',
        );
      }
    } catch (e) {
      logger.e('Error: $e');
      rethrow;
    }
  }

  @override
  Future<void> getReadAll() async {
    try {
      final response = await dioClient.put(ApiUrls.readAll);
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Succes: ${response.data}');
      } else {
        throw Exception(
          'Error: status code: ${response.statusCode}: ${response.data}',
        );
      }
    } catch (e) {
      logger.e('Error: $e');
      rethrow;
    }
  }

  @override
  Future<BannersResponseModel> getBanners() async {
    try {
      final response = await dioClient.get(ApiUrls.banners);
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Succes: ${response.data}');
        return BannersResponseModel.fromJson(response.data);
      } else {
        throw Exception(
          'Error: status code: ${response.statusCode}: ${response.data}',
        );
      }
    } catch (e) {
      logger.e('Error: $e');
      rethrow;
    }
  }
}
