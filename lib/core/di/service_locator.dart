import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:skills_xorijdaish/features/courses/data/repo/courses_repo_impl.dart';
import 'package:skills_xorijdaish/features/courses/data/source/courses_remote_datasource.dart';
import 'package:skills_xorijdaish/features/courses/data/source/courses_remote_datasource_impl.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/country_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/courses_card_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/foreign_language_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/pre_trip_courses_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/soft_skills_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/foreign_language/foreign_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/pre_trip_courses/pre_trip_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/soft_skills/soft_skills_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/countries/countries_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses/course_bloc.dart';
import 'package:skills_xorijdaish/features/profile/data/repo/profile_repo_impl.dart';
import 'package:skills_xorijdaish/features/profile/data/source/profile_remote_data_source.dart';
import 'package:skills_xorijdaish/features/profile/data/source/profile_remote_data_source_impl.dart';
import 'package:skills_xorijdaish/features/profile/domain/repo/profile_repository.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/self_profile_use_case.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/self_info/self_info_bloc.dart';
import 'package:skills_xorijdaish/features/reels/data/repository/reels_repo_impl.dart';
import 'package:skills_xorijdaish/features/reels/data/source/reels_data_source.dart';
import 'package:skills_xorijdaish/features/reels/data/source/reels_data_source_impl.dart';
import 'package:skills_xorijdaish/features/reels/domain/repository/reels_repository.dart';
import 'package:skills_xorijdaish/features/reels/domain/usecase/reels_use_case.dart';
import 'package:skills_xorijdaish/features/reels/presentation/bloc/get_reels/reels_bloc.dart';

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

  /// REPO
  sl.registerLazySingleton<CoursesRepository>(() => CoursesRepoImpl(sl()));
  sl.registerLazySingleton<ReelsRepository>(() => ReelsRepoImpl(sl()));
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepoImpl(sl()));

  /// UseCase
  // countries
  sl.registerLazySingleton(() => CountryUseCase(sl()));

  // courses
  sl.registerLazySingleton(() => CoursesCardUseCase(sl()));
  sl.registerLazySingleton(() => SoftSkillsUseCase(sl()));
  sl.registerLazySingleton(() => ForeignLanguageUseCase(sl()));
  sl.registerLazySingleton(() => PreTripCoursesUseCase(sl()));

  //profile
  sl.registerLazySingleton(() => SelfProfileUseCase(sl()));

  // reels
  sl.registerLazySingleton(() => ReelsUseCase(sl()));

  /// BLOC
  // courses
  sl.registerLazySingleton(() => CountriesBloc(sl()));
  sl.registerLazySingleton(() => CourseBloc(sl()));
  sl.registerLazySingleton(() => SoftSkillsBloc(sl()));
  sl.registerLazySingleton(() => ForeignBloc(sl()));
  sl.registerLazySingleton(() => PreTripBloc(sl()));

  // reels
  sl.registerLazySingleton(() => ReelsBloc(sl()));

  //profile
  sl.registerLazySingleton(() => SelfInfoBloc(sl()));
}
