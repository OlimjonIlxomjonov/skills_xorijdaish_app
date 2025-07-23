import 'package:skills_xorijdaish/features/profile/domain/entity/support/support_response.dart';

class SupportState {
  SupportState();
}

class SupportInitial extends SupportState {}

class SupportLoading extends SupportState {}

class SupportLoaded extends SupportState {
  final SupportResponse response;

  SupportLoaded(this.response);
}

class SupportError extends SupportState {
  final String message;

  SupportError(this.message);
}
