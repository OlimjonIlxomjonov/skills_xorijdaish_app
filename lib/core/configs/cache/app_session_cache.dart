import 'package:skills_xorijdaish/features/courses/domain/entities/courses/courses_response.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/self_profile_entity.dart';

import '../../../features/courses/domain/entities/countries_entity.dart';

class AppSessionCache {
  static final AppSessionCache _instance = AppSessionCache._internal();

  factory AppSessionCache() => _instance;

  AppSessionCache._internal();

  /// APIs
  SelfProfileEntity? selfInfo;
  List<CountryEnt>? countryInfo;
  CourseStatsResponse? coursesInfo;

}

final appSession = AppSessionCache();
