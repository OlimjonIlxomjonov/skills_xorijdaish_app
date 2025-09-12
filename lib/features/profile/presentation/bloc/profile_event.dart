import 'dart:io';

class ProfileEvent {
  ProfileEvent();
}

class SelfInfoEvent extends ProfileEvent {}

class SessionEvent extends ProfileEvent {}

class RevokeSessionEvent extends ProfileEvent {
  final String sessionId;

  RevokeSessionEvent(this.sessionId);
}

class SupportEvent extends ProfileEvent {
  final int page;

  SupportEvent(this.page);
}

class CreateTicketEvent extends ProfileEvent {
  final String title;
  final String text;
  final String phoneNumber;
  final List<File> file;

  CreateTicketEvent(this.title, this.text, this.phoneNumber, this.file);
}

class CertificateEvent extends ProfileEvent {}

class UpdateAvatarEvent extends ProfileEvent {
  final File avatar;

  UpdateAvatarEvent(this.avatar);
}

class TicketsMessageEvent extends ProfileEvent {
  final int ticketId;

  TicketsMessageEvent(this.ticketId);
}

class SendMessageEvent extends ProfileEvent {
  final int ticketId;
  final String text;
  final List<File> files;

  SendMessageEvent(this.ticketId, this.text, this.files);
}

class DownloadImageEvent extends ProfileEvent {
  final int ticketId;
  final int fileId;

  DownloadImageEvent(this.ticketId, this.fileId);
}

class FaqsEvent extends ProfileEvent {}
