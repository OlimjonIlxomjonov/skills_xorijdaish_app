import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/self_profile_use_case.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/self_info/self_info_state.dart';

import '../../../../../core/configs/cache/app_session_cache.dart';

class SelfInfoBloc extends Bloc<ProfileEvent, SelfInfoState> {
  final SelfProfileUseCase useCase;

  SelfInfoBloc(this.useCase) : super(SelfInfoInitial()) {
    on<SelfInfoEvent>((event, emit) async {
      try {
        final response = await useCase.call();
        emit(SelfInfoLoaded(response));
      } catch (e) {
        emit(SelfInfoError(e.toString()));
      }
    });
  }
}
