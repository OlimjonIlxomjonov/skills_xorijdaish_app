import 'package:skills_xorijdaish/features/home/domain/entities/notification/notification_response.dart';

class NotifState {
  NotifState();
}

class NotifInitial extends NotifState {}

class NotifLoading extends NotifState {}

class NotifLoaded extends NotifState {
  final NotificationResponse response;

  NotifLoaded(this.response);
}

class NotifError extends NotifState {
  final String message;

  NotifError(this.message);
}
