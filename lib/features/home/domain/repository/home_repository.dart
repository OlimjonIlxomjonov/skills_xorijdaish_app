import 'package:skills_xorijdaish/features/home/domain/entities/banners/banners_response.dart';
import 'package:skills_xorijdaish/features/home/domain/entities/notification/notification_response.dart';
import 'package:skills_xorijdaish/features/home/domain/entities/notification/notifications_count_entity.dart';
import 'package:skills_xorijdaish/features/home/domain/entities/search/search_response.dart';

abstract class HomeRepository {
  Future<NotificationResponse> fetchNotifications({int page = 1});

  Future<SearchResponse> fetchSearch({required String query});

  Future<NotificationsCountEntity> fetchNotificationsCount();

  Future<void> readAll();

  Future<BannersResponse> fetchBanners();
}
