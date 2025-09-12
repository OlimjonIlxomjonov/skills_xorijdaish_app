import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/send_message.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/send_message/send_message_state.dart';

class SendMessageBloc extends Bloc<ProfileEvent, SendMessageState> {
  final SendMessageUseCase useCase;

  SendMessageBloc(this.useCase) : super(SendMessageInitial()) {
    on<SendMessageEvent>((event, emit) async {
      try {
        await useCase.call(
          ticketId: event.ticketId,
          text: event.text,
          files: event.files,
        );
        emit(SendMessageLoaded());
      } catch (e) {
        emit(SendMessageError(e.toString()));
      }
    });
  }
}
