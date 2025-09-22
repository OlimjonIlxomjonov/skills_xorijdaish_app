import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/support_use_case.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/support/support_state.dart';

class SupportBloc extends Bloc<ProfileEvent, SupportState> {
  final SupportUseCase useCase;

  SupportBloc(this.useCase) : super(SupportInitial()) {
    on<SupportEvent>((event, emit) async {
      try {
        final response = await useCase.call(page: event.page);

        if (event.page > 1 && state is SupportLoaded) {
          final oldState = state as SupportLoaded;
          final updatedData = [...oldState.response.data, ...response.data];

          final updatedResponse = response.copyWith(
            data: updatedData,
            metaData: response.metaData,
            links: response.links,
          );

          emit(SupportLoaded(updatedResponse));
        } else {
          emit(SupportLoaded(response));
        }
      } catch (e) {
        emit(SupportError(e.toString()));
      }
    });
  }
}
