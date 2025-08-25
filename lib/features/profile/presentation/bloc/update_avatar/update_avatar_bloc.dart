import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/update_avatar_use_case.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/update_avatar/update_avatar_state.dart';

class UpdateAvatarBloc extends Bloc<ProfileEvent, UpdateAvatarState> {
  final UpdateAvatarUseCase useCase;

  UpdateAvatarBloc(this.useCase) : super(UpdateAvatarInitial()) {
    on<UpdateAvatarEvent>((event, emit) async {
      emit(UpdateAvatarLoading());
      try {
        await useCase.call(avatar: event.avatar);
        emit(UpdateAvatarLoaded());
      } catch (e) {
        emit(UpdateAvatarError(e.toString()));
      }
    });
  }
}
