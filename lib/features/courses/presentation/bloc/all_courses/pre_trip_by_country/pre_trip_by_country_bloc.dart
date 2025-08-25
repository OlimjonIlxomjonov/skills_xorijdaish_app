import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/pre_trip_by_country_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/pre_trip_courses/pre_trip_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';

class PreTripByCountryBloc extends Bloc<CoursesEvent, PreTripState> {
  final PreTripByCountryUseCase useCase;

  PreTripByCountryBloc(this.useCase) : super(PreTripInitial()) {
    on<PreTripByCountryEvent>((event, emit) async {
      emit(PreTripLoading());
      try {
        final response = await useCase.call(countryId: event.countryId);
        emit(PreTripLoaded(response));
      } catch (e) {
        emit(PreTripError(e.toString()));
      }
    });
  }
}
