import 'package:skills_xorijdaish/features/home/domain/entities/notification/notification_response.dart';
import 'package:skills_xorijdaish/features/home/domain/repository/home_repository.dart';

class NotificationsUseCase {
  final HomeRepository repository;

  NotificationsUseCase(this.repository);

  Future<NotificationResponse> call({int page = 1}) {
    return repository.fetchNotifications(page: page);
  }
}
