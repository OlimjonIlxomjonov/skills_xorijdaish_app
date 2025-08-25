import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/tickets_message_response.dart';

class TicketsMessageState {
  TicketsMessageState();
}

class TicketsMessageInitial extends TicketsMessageState {}

class TicketsMessageLoading extends TicketsMessageState {}

class TicketsMessageLoaded extends TicketsMessageState {
  final TicketsMessageResponse response;

  TicketsMessageLoaded(this.response);
}

class TicketsMessageError extends TicketsMessageState {
  final String message;

  TicketsMessageError(this.message);
}
