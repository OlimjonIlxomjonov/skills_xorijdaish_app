import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/foreign_language/foreign_language_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/pre_trip_courses/pre_trip_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/soft_skills/soft_skills_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/courses/courses_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/get_files/file_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/get_video/video_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lessons/lessons_response.dart';
import 'package:skills_xorijdaish/features/home/domain/entities/banners/banners_entity.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/self_profile_entity.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/session/session_response.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/active_sessions/active_session_page.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/self_information/user_info_storage.dart';
import 'package:skills_xorijdaish/features/reels/domain/entity/reels_response.dart';
import 'package:skills_xorijdaish/features/statistics/domain/entity/avrage/average_response.dart';
import 'package:skills_xorijdaish/features/statistics/domain/entity/course/course_time_response.dart';
import 'package:skills_xorijdaish/features/statistics/domain/entity/weekly/week_response.dart';

import '../../../features/courses/domain/entities/countries_entity.dart';
import '../../../features/courses/domain/entities/lesson_tests/lesson_tests_response.dart';
import '../../../features/home/domain/entities/banners/banners_response.dart';

class AppSessionCache {
  static final AppSessionCache _instance = AppSessionCache._internal();

  factory AppSessionCache() => _instance;

  AppSessionCache._internal();

  /// APIs
  SelfProfileEntity? selfInfo;
  List<CountryEnt>? countryInfo;

  PreTripResponse? preTripInfo;
  SoftSkillsResponse? softSkillsInfo;
  CourseStatsResponse? coursesInfo;
  ForeignLanguageResponse? foreignLanguageInfo;
  BannersResponse? bannersResponse;

  // video lessons
  LessonTestsResponse? lessonTestsResponse;
  FileEntity? fileResponse;

  // stats
  AverageResponse? averageResponse;
  WeekResponse? weekResponse;
}

final appSession = AppSessionCache();
