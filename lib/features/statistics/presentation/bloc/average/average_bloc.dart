import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/core/configs/cache/app_session_cache.dart';
import 'package:skills_xorijdaish/features/statistics/domain/usecase/average_use_case.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/average/average_state.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/stats_event.dart';

class AverageBloc extends Bloc<StatsEvent, AverageState> {
  final AverageUseCase useCase;

  AverageBloc(this.useCase) : super(AverageInitial()) {
    on<AverageEvent>((event, emit) async {
      emit(AverageLoading());
      if (appSession.averageResponse != null) {
        emit(AverageLoaded(appSession.averageResponse!));
        return;
      }
      try {
        final response = await useCase.call();
        appSession.averageResponse = response;
        emit(AverageLoaded(response));
      } catch (e) {
        emit(AverageError(e.toString()));
      }
    });
  }
}
