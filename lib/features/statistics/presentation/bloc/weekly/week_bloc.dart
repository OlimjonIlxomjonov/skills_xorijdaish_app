import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/core/configs/cache/app_session_cache.dart';
import 'package:skills_xorijdaish/features/statistics/domain/usecase/week_use_case.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/stats_event.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/weekly/week_stats.dart';

class WeekBloc extends Bloc<StatsEvent, WeekStats> {
  final WeekUseCase useCase;

  WeekBloc(this.useCase) : super(WeekStatsInitial()) {
    on<WeekEvent>((event, emit) async {
      if (appSession.weekResponse != null) {
        emit(WeekStatsLoaded(appSession.weekResponse!));
        return;
      }
      emit(WeekStatsLoading());
      try {
        final response = await useCase.call();
        appSession.weekResponse = response;
        emit(WeekStatsLoaded(response));
      } catch (e) {
        emit(WeekStatsError(e.toString()));
      }
    });
  }
}
