import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/tickets_message_use_case.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/tickets_message/tickets_message_state.dart';

class TicketsMessageBloc extends Bloc<ProfileEvent, TicketsMessageState> {
  final TicketsMessageUseCase useCase;

  TicketsMessageBloc(this.useCase) : super(TicketsMessageInitial()) {
    on<TicketsMessageEvent>((event, emit) async {
      try {
        final response = await useCase.call(ticketId: event.ticketId);
        emit(TicketsMessageLoaded(response));
      } catch (e) {
        emit(TicketsMessageError(e.toString()));
      }
    });
  }
}
