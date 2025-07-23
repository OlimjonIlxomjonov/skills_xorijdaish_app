import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/post_ticket_use_case.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/create_ticket/create_ticket_state.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';

class CreateTicketBloc extends Bloc<ProfileEvent, CreateTicketState> {
  final PostTicketUseCase useCase;

  CreateTicketBloc(this.useCase) : super(CreateTicketInitial()) {
    on<CreateTicketEvent>((event, emit) async {
      emit(CreateTicketLoading());
      try {
        await useCase.call(
          title: event.title,
          text: event.text,
          phoneNumber: event.phoneNumber,
          file: event.file,
        );
        emit(CreateTicketLoaded());
      } catch (e) {
        emit(CreateTicketError(e.toString()));
      }
    });
  }
}
