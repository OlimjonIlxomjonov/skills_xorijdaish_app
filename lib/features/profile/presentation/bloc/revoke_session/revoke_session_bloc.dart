import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/revoke_session_use_case.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/revoke_session/revoke_session_state.dart';

class RevokeSessionBloc extends Bloc<ProfileEvent, RevokeSessionState> {
  final RevokeSessionUseCase useCase;

  RevokeSessionBloc(this.useCase) : super(RevokeSessionInitial()) {
    on<RevokeSessionEvent>((event, emit) async {
      emit(RevokeSessionLoading());
      try {
        await useCase.call(sessionId: event.sessionId);
        emit(RevokeSessionLoaded());
      } catch (e) {
        emit(RevokeSessionError(e.toString()));
      }
    });
  }
}
