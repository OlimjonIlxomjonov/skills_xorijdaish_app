class CreateTicketState {
  CreateTicketState();
}

class CreateTicketInitial extends CreateTicketState {}

class CreateTicketLoading extends CreateTicketState {}

class CreateTicketLoaded extends CreateTicketState {}

class CreateTicketError extends CreateTicketState {
  final String message;

  CreateTicketError(this.message);
}
