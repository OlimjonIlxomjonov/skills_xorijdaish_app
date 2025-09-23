import 'package:skills_xorijdaish/features/home/data/source/home_remote_data_source.dart';
import 'package:skills_xorijdaish/features/home/domain/entities/banners/banners_response.dart';
import 'package:skills_xorijdaish/features/home/domain/entities/notification/notification_response.dart';
import 'package:skills_xorijdaish/features/home/domain/entities/notification/notifications_count_entity.dart';
import 'package:skills_xorijdaish/features/home/domain/entities/search/search_response.dart';
import 'package:skills_xorijdaish/features/home/domain/repository/home_repository.dart';

class HomeRepoImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepoImpl(this.remoteDataSource);

  @override
  Future<NotificationResponse> fetchNotifications({int page = 1}) {
    return remoteDataSource.getNotifications(page: page);
  }

  @override
  Future<SearchResponse> fetchSearch({required String query}) {
    return remoteDataSource.getSearch(query: query);
  }

  @override
  Future<NotificationsCountEntity> fetchNotificationsCount() {
    return remoteDataSource.getNotificationsCount();
  }

  @override
  Future<void> readAll() {
    return remoteDataSource.getReadAll();
  }

  @override
  Future<BannersResponse> fetchBanners() {
    return remoteDataSource.getBanners();
  }

  @override
  Future<void> readOne({required int id}) {
    return remoteDataSource.getReadOne(id: id);
  }
}
