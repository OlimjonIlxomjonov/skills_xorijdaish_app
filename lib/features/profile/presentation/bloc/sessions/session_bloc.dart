import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/session_use_case.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/sessions/session_state.dart';

class SessionBloc extends Bloc<ProfileEvent, SessionState> {
  final SessionUseCase useCase;

  SessionBloc(this.useCase) : super(SessionInitial()) {
    on<SessionEvent>((event, emit) async {
      emit(SessionLoading());
      try {
        final response = await useCase.call();
        emit(SessionLoaded(response));
      } catch (e) {
        emit(SessionError(e.toString()));
      }
    });
  }
}
