import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/home/domain/usecase/notifications_use_case.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/home_event.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/notifications/notif_state.dart';

class NotifBloc extends Bloc<HomeEvent, NotifState> {
  final NotificationsUseCase useCase;

  NotifBloc(this.useCase) : super(NotifInitial()) {
    on<NotificationsEvent>((event, emit) async {
      try {
        final response = await useCase.call(page: event.page);
        if (state is NotifLoaded) {
          final oldState = state as NotifLoaded;

          final updatedData = [...oldState.response.data, ...response.data];

          final updatedResponse = response.copyWith(
            data: updatedData,
            metaData: response.metaData,
            links: response.links,
          );
          emit(NotifLoaded(updatedResponse));
        } else {
          emit(NotifLoaded(response));
        }
      } catch (e) {
        emit(NotifError(e.toString()));
      }
    });
  }
}
