import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/core/configs/cache/app_session_cache.dart';
import 'package:skills_xorijdaish/features/home/domain/usecase/banners_use_case.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/banners/banners_state.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/home_event.dart';

class BannersBloc extends Bloc<HomeEvent, BannersState> {
  final BannersUseCase useCase;

  BannersBloc(this.useCase) : super(BannersInitial()) {
    on<BannersEvent>((event, emit) async {
      emit(BannersLoading());
      if (appSession.bannersResponse != null) {
        return emit(BannersLoaded(appSession.bannersResponse!));
      }
      try {
        final response = await useCase.call();
        appSession.bannersResponse = response;
        emit(BannersLoaded(response));
      } catch (e) {
        emit(BannersError(e.toString()));
      }
    });
  }
}
