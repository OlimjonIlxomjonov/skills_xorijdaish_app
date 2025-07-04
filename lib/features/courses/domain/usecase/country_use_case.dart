import 'package:skills_xorijdaish/features/courses/domain/entities/countries_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class CountryUseCase {
  final CoursesRepository repo;

  CountryUseCase(this.repo);

  Future<List<CountryEnt>> call() {
    return repo.fetchAllCounties();
  }
}
