import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:skills_xorijdaish/features/courses/data/repo/courses_repo_impl.dart';
import 'package:skills_xorijdaish/features/courses/data/source/courses_remote_datasource.dart';
import 'package:skills_xorijdaish/features/courses/data/source/courses_remote_datasource_impl.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/answer_to_test.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/country_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/course_by_id_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/courses_card_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/file_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/foreign_language_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/lesson_test_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/lessons_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/my_courses_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/pre_trip_courses_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/skill_test_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/soft_skills_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/start_course.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/test_by_id_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/video_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/foreign_language/foreign_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/pre_trip_courses/pre_trip_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/skill_test/skill_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/soft_skills/soft_skills_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/countries/countries_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses/course_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_courses_by_id/course_by_id_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_file/file_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/answer_to_test/answer_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/lesson_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/test_by_id/single_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lessons/lesson_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/my_courses/my_course_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/start_course/start_course_bloc.dart';
import 'package:skills_xorijdaish/features/profile/data/repo/profile_repo_impl.dart';
import 'package:skills_xorijdaish/features/profile/data/source/profile_remote_data_source.dart';
import 'package:skills_xorijdaish/features/profile/data/source/profile_remote_data_source_impl.dart';
import 'package:skills_xorijdaish/features/profile/domain/repo/profile_repository.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/certificate_use_case.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/post_ticket_use_case.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/revoke_session_use_case.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/self_profile_use_case.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/session_use_case.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/support_use_case.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/certificate/certificate_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/create_ticket/create_ticket_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/revoke_session/revoke_session_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/self_info/self_info_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/sessions/session_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/support/support_bloc.dart';
import 'package:skills_xorijdaish/features/reels/data/repository/reels_repo_impl.dart';
import 'package:skills_xorijdaish/features/reels/data/source/reels_data_source.dart';
import 'package:skills_xorijdaish/features/reels/data/source/reels_data_source_impl.dart';
import 'package:skills_xorijdaish/features/reels/domain/repository/reels_repository.dart';
import 'package:skills_xorijdaish/features/reels/domain/usecase/post_reels_like.dart';
import 'package:skills_xorijdaish/features/reels/domain/usecase/reels_use_case.dart';
import 'package:skills_xorijdaish/features/reels/presentation/bloc/get_reels/reels_bloc.dart';
import 'package:skills_xorijdaish/features/reels/presentation/bloc/put_like/like_bloc.dart';
import 'package:skills_xorijdaish/features/statistics/data/repo/stats_repo_impl.dart';
import 'package:skills_xorijdaish/features/statistics/data/source/stats_remote_data_source.dart';
import 'package:skills_xorijdaish/features/statistics/data/source/stats_remote_data_source_impl.dart';
import 'package:skills_xorijdaish/features/statistics/domain/repository/stats_repository.dart';
import 'package:skills_xorijdaish/features/statistics/domain/usecase/average_use_case.dart';
import 'package:skills_xorijdaish/features/statistics/domain/usecase/course_time_use_case.dart';
import 'package:skills_xorijdaish/features/statistics/domain/usecase/week_use_case.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/average/average_bloc.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/course/course_time_bloc.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/weekly/week_bloc.dart';

import '../../features/courses/presentation/bloc/get_video/video_bloc.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton(() => Dio());

  /// REMOTE
  sl.registerLazySingleton<CoursesRemoteDatasource>(
    () => CoursesRemoteDatasourceImpl(),
  );
  sl.registerLazySingleton<ReelsDataSource>(() => ReelsDataSourceImpl());
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<StatsRemoteDataSource>(
    () => StatsRemoteDataSourceImpl(),
  );

  /// REPO
  sl.registerLazySingleton<CoursesRepository>(() => CoursesRepoImpl(sl()));
  sl.registerLazySingleton<ReelsRepository>(() => ReelsRepoImpl(sl()));
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepoImpl(sl()));
  sl.registerLazySingleton<StatsRepository>(() => StatsRepoImpl(sl()));

  /// UseCase
  // countries
  sl.registerLazySingleton(() => CountryUseCase(sl()));

  // courses
  sl.registerLazySingleton(() => CoursesCardUseCase(sl()));
  sl.registerLazySingleton(() => SoftSkillsUseCase(sl()));
  sl.registerLazySingleton(() => ForeignLanguageUseCase(sl()));
  sl.registerLazySingleton(() => PreTripCoursesUseCase(sl()));
  sl.registerLazySingleton(() => SkillTestUseCase(sl()));
  sl.registerLazySingleton(() => CourseByIdUseCase(sl()));
  sl.registerLazySingleton(() => MyCoursesUseCase(sl()));

  // tests
  sl.registerLazySingleton(() => AnswerToTestUseCase(sl()));

  //profile
  sl.registerLazySingleton(() => SelfProfileUseCase(sl()));
  sl.registerLazySingleton(() => SessionUseCase(sl()));
  sl.registerLazySingleton(() => RevokeSessionUseCase(sl()));
  sl.registerLazySingleton(() => SupportUseCase(sl()));
  sl.registerLazySingleton(() => PostTicketUseCase(sl()));
  sl.registerLazySingleton(() => CertificateUseCase(sl()));

  // reels
  sl.registerLazySingleton(() => ReelsUseCase(sl()));
  sl.registerLazySingleton(() => PostReelsLikeUseCase(sl()));

  // lessons
  sl.registerLazySingleton(() => LessonsUseCase(sl()));
  sl.registerLazySingleton(() => VideoUseCase(sl()));
  sl.registerLazySingleton(() => FileUseCase(sl()));
  sl.registerLazySingleton(() => LessonTestUseCase(sl()));
  sl.registerLazySingleton(() => TestByIdUseCase(sl()));
  sl.registerLazySingleton(() => StartCourseUseCase(sl()));

  // statistics
  sl.registerLazySingleton(() => AverageUseCase(sl()));
  sl.registerLazySingleton(() => WeekUseCase(sl()));
  sl.registerLazySingleton(() => CourseTimeUseCase(sl()));

  /// BLOC
  // courses
  sl.registerLazySingleton(() => CountriesBloc(sl()));
  sl.registerLazySingleton(() => CourseBloc(sl()));
  sl.registerLazySingleton(() => SoftSkillsBloc(sl()));
  sl.registerLazySingleton(() => ForeignBloc(sl()));
  sl.registerLazySingleton(() => PreTripBloc(sl()));
  sl.registerLazySingleton(() => SkillTestBloc(sl()));
  sl.registerLazySingleton(() => CourseByIdBloc(sl()));
  sl.registerLazySingleton(() => MyCourseBloc(sl()));

  // reels
  sl.registerLazySingleton(() => ReelsBloc(sl()));
  sl.registerLazySingleton(() => LikeBloc(sl()));

  //profile
  sl.registerLazySingleton(() => SelfInfoBloc(sl()));
  sl.registerLazySingleton(() => SessionBloc(sl()));
  sl.registerLazySingleton(() => RevokeSessionBloc(sl()));
  sl.registerLazySingleton(() => SupportBloc(sl()));
  sl.registerLazySingleton(() => CreateTicketBloc(sl()));
  sl.registerLazySingleton(() => CertificateBloc(sl()));

  // lessons
  sl.registerLazySingleton(() => LessonsBloc(sl()));
  sl.registerLazySingleton(() => VideoBloc(sl()));
  sl.registerLazySingleton(() => FileBloc(sl()));
  sl.registerLazySingleton(() => LessonTestBloc(sl()));
  sl.registerLazySingleton(() => SingleTestBloc(sl()));
  sl.registerLazySingleton(() => StartCourseBloc(sl()));

  // test
  sl.registerLazySingleton(() => AnswerBloc(sl()));

  // statistics
  sl.registerLazySingleton(() => AverageBloc(sl()));
  sl.registerLazySingleton(() => WeekBloc(sl()));
  sl.registerLazySingleton(() => CourseTimeBloc(sl()));
}
