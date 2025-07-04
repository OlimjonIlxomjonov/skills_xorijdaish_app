import 'package:skills_xorijdaish/features/courses/data/source/courses_remote_datasource_impl.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/courses/courses_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

import '../../domain/entities/countries_entity.dart';

class CoursesRepoImpl implements CoursesRepository {
  final CoursesRemoteDatasource datasource;

  CoursesRepoImpl(this.datasource);

  @override
  Future<List<CountryEnt>> fetchAllCounties() {
    return datasource.getAllCountry();
  }

  @override
  Future<CourseStatsResponse> fetchAllCourses() {
    return datasource.getAllCourses();
  }
}
