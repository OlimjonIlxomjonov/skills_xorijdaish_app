import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/pre_trip_courses/pre_trip_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class PreTripByCountryUseCase {
  final CoursesRepository repository;

  PreTripByCountryUseCase(this.repository);

  Future<PreTripResponse> call({required int countryId}) {
    return repository.fetchPreTripByCountry(countryId: countryId);
  }
}
