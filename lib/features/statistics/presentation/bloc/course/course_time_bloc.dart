import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/statistics/domain/usecase/course_time_use_case.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/course/course_time_state.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/stats_event.dart';

class CourseTimeBloc extends Bloc<StatsEvent, CourseTimeState> {
  final CourseTimeUseCase useCase;

  CourseTimeBloc(this.useCase) : super(CourseTimeStateInitial()) {
    on<CourseTimeEvent>((event, emit) async {
      emit(CourseTimeStateLoading());
      try {
        final response = await useCase.call(date: event.date);
        emit(CourseTimeStateLoaded(response));
      } catch (e) {
        emit(CourseTimeStateError(e.toString()));
      }
    });
  }
}
