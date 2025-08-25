import 'package:skills_xorijdaish/features/home/domain/entities/notification/notifications_count_entity.dart';

class NotifCountState {
  NotifCountState();
}

class NotifCountInitial extends NotifCountState {}

class NotifCountLoading extends NotifCountState {}

class NotifCountLoaded extends NotifCountState {
  final NotificationsCountEntity entity;

  NotifCountLoaded(this.entity);
}

class NotifCountError extends NotifCountState {
  final String message;

  NotifCountError(this.message);
}
