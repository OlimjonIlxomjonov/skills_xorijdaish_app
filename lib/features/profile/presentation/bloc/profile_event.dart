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

class SupportEvent extends ProfileEvent {}

class CreateTicketEvent extends ProfileEvent {
  final String title;
  final String text;
  final String phoneNumber;
  final File? file;

  CreateTicketEvent(this.title, this.text, this.phoneNumber, this.file);
}

class CertificateEvent extends ProfileEvent {}
