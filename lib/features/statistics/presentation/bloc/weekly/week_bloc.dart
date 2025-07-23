import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/statistics/domain/usecase/week_use_case.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/stats_event.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/weekly/week_stats.dart';

class WeekBloc extends Bloc<StatsEvent, WeekStats> {
  final WeekUseCase useCase;

  WeekBloc(this.useCase) : super(WeekStatsInitial()) {
    on<WeekEvent>((event, emit) async {
      emit(WeekStatsLoading());
      try {
        final response = await useCase.call();
        emit(WeekStatsLoaded(response));
      } catch (e) {
        emit(WeekStatsError(e.toString()));
      }
    });
  }
}
