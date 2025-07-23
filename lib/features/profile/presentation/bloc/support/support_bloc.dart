import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/support_use_case.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/support/support_state.dart';

class SupportBloc extends Bloc<ProfileEvent, SupportState> {
  final SupportUseCase useCase;

  SupportBloc(this.useCase) : super(SupportInitial()) {
    on<SupportEvent>((event, emit) async {
      emit(SupportLoading());
      try {
        final response = await useCase.call();
        emit(SupportLoaded(response));
      } catch (e) {
        emit(SupportError(e.toString()));
      }
    });
  }
}
