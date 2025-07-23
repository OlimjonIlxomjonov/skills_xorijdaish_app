import 'package:skills_xorijdaish/features/profile/domain/entity/session/session_response.dart';

class SessionState {
  SessionState();
}

class SessionInitial extends SessionState {}

class SessionLoading extends SessionState {}

class SessionLoaded extends SessionState {
  final SessionResponse response;

  SessionLoaded(this.response);
}

class SessionError extends SessionState {
  final String message;

  SessionError(this.message);
}
