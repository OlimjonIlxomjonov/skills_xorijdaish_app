import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/home/domain/usecase/notifications_count_use_case.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/home_event.dart';

import 'notif_count_state.dart';

class NotifCountBloc extends Bloc<HomeEvent, NotifCountState> {
  final NotificationsCountUseCase useCase;

  NotifCountBloc(this.useCase) : super(NotifCountInitial()) {
    on<NotifCountEvent>((event, emit) async {
      emit(NotifCountLoading());
      try {
        final response = await useCase.call();
        emit(NotifCountLoaded(response));
      } catch (e) {
        emit(NotifCountError(e.toString()));
      }
    });
  }
}
