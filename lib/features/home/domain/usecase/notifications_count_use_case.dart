import 'package:skills_xorijdaish/features/home/domain/entities/notification/notifications_count_entity.dart';
import 'package:skills_xorijdaish/features/home/domain/repository/home_repository.dart';

class NotificationsCountUseCase {
  final HomeRepository repository;

  NotificationsCountUseCase(this.repository);

  Future<NotificationsCountEntity> call() {
    return repository.fetchNotificationsCount();
  }
}
