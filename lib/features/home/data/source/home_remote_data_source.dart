import 'package:skills_xorijdaish/features/home/data/models/banners/banners_response_model.dart';
import 'package:skills_xorijdaish/features/home/data/models/notification/notification_response_model.dart';
import 'package:skills_xorijdaish/features/home/data/models/search/search_response_model.dart';

import '../models/notification/notifications_count_model.dart';

abstract class HomeRemoteDataSource {
  Future<NotificationResponseModel> getNotifications({int page = 1});

  Future<SearchResponseModel> getSearch({required String query});

  Future<NotificationsCountModel> getNotificationsCount();

  Future<void> getReadAll();

  Future<BannersResponseModel> getBanners();
}
