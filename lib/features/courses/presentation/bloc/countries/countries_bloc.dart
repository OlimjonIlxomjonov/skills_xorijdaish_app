import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/core/configs/cache/app_session_cache.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/country_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/countries/countries_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';

class CountriesBloc extends Bloc<CoursesEvent, CountriesState> {
  final CountryUseCase usecase;

  CountriesBloc(this.usecase) : super(CountriesInitial()) {
    on<GetCountriesEvent>((event, emit) async {
      emit(CountriesLoading());
      if (appSession.countryInfo != null) {
        emit(CountriesLoaded(appSession.countryInfo!));
        return;
      }
      try {
        final result = await usecase.call();
        appSession.countryInfo = result;
        emit(CountriesLoaded(result));
      } catch (e) {
        emit(CountriesError(e.toString()));
      }
    });
  }
}
