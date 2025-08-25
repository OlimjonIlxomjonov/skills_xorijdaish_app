import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/home/domain/usecase/notifications_use_case.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/home_event.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/notifications/notif_state.dart';

class NotifBloc extends Bloc<HomeEvent, NotifState> {
  final NotificationsUseCase useCase;

  NotifBloc(this.useCase) : super(NotifInitial()) {
    on<NotificationsEvent>((event, emit) async {
      emit(NotifLoading());
      try {
        final response = await useCase.call(page: event.page);
        emit(NotifLoaded(response));
      } catch (e) {
        emit(NotifError(e.toString()));
      }
    });
  }
}
