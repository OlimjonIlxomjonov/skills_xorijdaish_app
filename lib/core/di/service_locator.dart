import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:skills_xorijdaish/features/courses/data/repo/courses_repo_impl.dart';
import 'package:skills_xorijdaish/features/courses/data/source/courses_remote_datasource.dart';
import 'package:skills_xorijdaish/features/courses/data/source/courses_remote_datasource_impl.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/country_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/courses_card_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/countries/countries_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses/course_bloc.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton(() => Dio());

  /// REMOTE
  sl.registerLazySingleton<CoursesRemoteDatasource>(
    () => CoursesRemoteDatasourceImpl(),
  );

  /// REPO
  sl.registerLazySingleton<CoursesRepository>(() => CoursesRepoImpl(sl()));

  /// UseCase
  // countries
  sl.registerLazySingleton(() => CountryUseCase(sl()));

  // courses
  sl.registerLazySingleton(() => CoursesCardUseCase(sl()));

  /// BLOC
  // courses
  sl.registerLazySingleton(() => CountriesBloc(sl()));

  // courses
  sl.registerLazySingleton(() => CourseBloc(sl()));
}
