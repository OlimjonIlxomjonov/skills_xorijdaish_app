import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/foreign_language/foreign_language_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/pre_trip_courses/pre_trip_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/soft_skills/soft_skills_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/courses/courses_response.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/self_profile_entity.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/session/session_response.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/active_sessions/active_session_page.dart';
import 'package:skills_xorijdaish/features/reels/domain/entity/reels_response.dart';

import '../../../features/courses/domain/entities/countries_entity.dart';

class AppSessionCache {
  static final AppSessionCache _instance = AppSessionCache._internal();

  factory AppSessionCache() => _instance;

  AppSessionCache._internal();

  /// APIs
  SelfProfileEntity? selfInfo;
  List<CountryEnt>? countryInfo;
  CourseStatsResponse? coursesInfo;
  PreTripResponse? preTripInfo;
  SoftSkillsResponse? softSkillsInfo;
  ForeignLanguageResponse? foreignLanguageInfo;
  ReelsResponse? reelsInfo;
  SessionResponse? sessions;
}

final appSession = AppSessionCache();
