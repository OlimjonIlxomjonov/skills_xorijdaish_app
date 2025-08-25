import 'package:skills_xorijdaish/features/home/domain/entities/notification/notifications_unread_count.dart';

class NotificationsUnreadModel extends NotificationsUnreadCount {
  NotificationsUnreadModel(super.unreadCount);

  factory NotificationsUnreadModel.fromJson(Map<String, dynamic> json) {
    return NotificationsUnreadModel(json['unread_count'] ?? 0);
  }
}
