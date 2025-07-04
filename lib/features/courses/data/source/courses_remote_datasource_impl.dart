import 'package:skills_xorijdaish/features/courses/data/models/countries_model.dart';
import 'package:skills_xorijdaish/features/courses/data/models/courses/courses_response_model.dart';

abstract class CoursesRemoteDatasource {
  Future<List<CountryModel>> getAllCountry();

  Future<CoursesResponseModel> getAllCourses();
}
