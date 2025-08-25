import 'package:skills_xorijdaish/features/home/data/models/notification/notifications_unread_model.dart';
import 'package:skills_xorijdaish/features/home/domain/entities/notification/notifications_count_entity.dart';

class NotificationsCountModel extends NotificationsCountEntity {
  NotificationsCountModel(super.ok, super.data);

  factory NotificationsCountModel.fromJson(Map<String, dynamic> json) {
    return NotificationsCountModel(
      json['ok'],
      NotificationsUnreadModel.fromJson(json['data']),
    );
  }
}
