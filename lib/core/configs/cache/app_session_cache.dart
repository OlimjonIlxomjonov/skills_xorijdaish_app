import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/foreign_language/foreign_language_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/pre_trip_courses/pre_trip_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/soft_skills/soft_skills_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/courses/courses_response.dart';
import 'package:skills_xorijdaish/features/statistics/domain/entity/avrage/average_response.dart';
import 'package:skills_xorijdaish/features/statistics/domain/entity/weekly/week_response.dart';
import '../../../features/courses/domain/entities/countries_entity.dart';
import '../../../features/home/domain/entities/banners/banners_response.dart';

class AppSessionCache {
  static final AppSessionCache _instance = AppSessionCache._internal();

  factory AppSessionCache() => _instance;

  AppSessionCache._internal();

  /// APIs
  List<CountryEnt>? countryInfo;

  PreTripResponse? preTripInfo;
  SoftSkillsResponse? softSkillsInfo;
  CourseStatsResponse? coursesInfo;
  ForeignLanguageResponse? foreignLanguageInfo;
  BannersResponse? bannersResponse;

  // stats
  AverageResponse? averageResponse;
  WeekResponse? weekResponse;
}

final appSession = AppSessionCache();
