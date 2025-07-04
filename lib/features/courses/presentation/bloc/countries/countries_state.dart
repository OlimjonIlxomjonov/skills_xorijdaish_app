
import '../../../domain/entities/countries_entity.dart';

abstract class CountriesState {
  CountriesState();
}

class CountriesInitial extends CountriesState {}

class CountriesLoading extends CountriesState {}

class CountriesLoaded extends CountriesState {
  final List<CountryEnt> response;

  CountriesLoaded(this.response);
}

class CountriesError extends CountriesState {
  final String message;

  CountriesError(this.message);
}
