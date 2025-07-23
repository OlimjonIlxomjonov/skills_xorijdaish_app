import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/core/configs/cache/app_session_cache.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/pre_trip_courses_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/pre_trip_courses/pre_trip_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';

class PreTripBloc extends Bloc<CoursesEvent, PreTripState> {
  final PreTripCoursesUseCase useCase;

  PreTripBloc(this.useCase) : super(PreTripInitial()) {
    on<PreTripEvent>((event, emit) async {
      emit(PreTripLoading());
      if (appSession.preTripInfo != null) {
        emit(PreTripLoaded(appSession.preTripInfo!));
        return;
      }
      try {
        final response = await useCase.call(query: event.query);
        appSession.preTripInfo = response;
        emit(PreTripLoaded(response));
      } catch (e) {
        emit(PreTripError(e.toString()));
      }
    });
  }
}
