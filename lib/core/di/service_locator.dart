import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:skills_xorijdaish/features/courses/data/repo/courses_repo_impl.dart';
import 'package:skills_xorijdaish/features/courses/data/source/courses_remote_datasource.dart';
import 'package:skills_xorijdaish/features/courses/data/source/courses_remote_datasource_impl.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/answer_to_test.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/buy_course/buy_course_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/country_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/course_by_id_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/courses_card_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/face_recognation/face_recognation_compare_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/face_recognation/face_recognition_my_id_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/file_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/final_test/ans_final_fill_in_the_blank_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/final_test/ans_final_listen_n_complete_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/final_test/ans_final_listen_n_complete_words.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/final_test/ans_final_multiple_choice_with_pictures_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/final_test/ans_final_select_pairs_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/final_test/answer_final_multiple_choice_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/final_test/fetch_final_test/final_listen_n_complete_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/foreign_language_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/lesson_by_id_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/lesson_test_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/lessons_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/my_courses_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/pre_trip_by_country_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/pre_trip_courses_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/rate_course/rate_coruse_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/set_video_time_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/skill_test_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/soft_skills_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/start_course.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/test_by_id_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/answer_fill_in_the_blank_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/answer_listen_n_complete_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/answer_select_pairs_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/fill_in_the_blank_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/final_test_by_id_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/final_test_course_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/finish_final_test_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/finish_test_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/listen_n_complate_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/listen_n_complete_words.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/listen_n_select_pairs_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/multiple_choice_with_pictures_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/select_pairs_use_case.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/video_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/buy_course/buy_course_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/foreign_language/foreign_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/pre_trip_by_country/pre_trip_by_country_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/pre_trip_courses/pre_trip_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/skill_test/skill_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/soft_skills/soft_skills_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/countries/countries_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses/course_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/face_recognation/face_recognition_compare/face_recognition_compare_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/face_recognation/face_recognition_my_id/face_rec_my_id_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/filil_in_the_blank/fetch_final_fill_in_the_blank_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/listen_n_complete_words/fetch_final_listen_n_complete_words_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/listen_n_select_pairs/fetch_final_listen_n_seletc_pairs_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/multiple_choice_with_pictures/fetch_final_multiple_choice_with_pictures_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/select_pairs/fetch_final_select_pairs_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/final_test_answers/fill_in_the_blank/fill_in_the_blank_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/final_test_answers/listen_and_complete/listen_n_complete_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/final_test_answers/listen_n_complete_words/listen_n_complete_words_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/final_test_answers/multiple_choice/final_multiple_choice_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/final_test_answers/multiple_choice_with_pictures/final_multiple_choice_with_pictures_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/final_test_answers/select_pairs/final_select_pairs_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/finish_final_test/finish_final_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_courses_by_id/course_by_id_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_file/file_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_by_id/lesson_by_id_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/answer_fill_in_the_blank/answer_fill_in_the_blank_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/answer_listen_n_complete/answer_liste_complete_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/answer_to_select_pairs/answer_select_pairs_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/answer_to_test/answer_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/fill_in_the_blank/fill_in_the_blank_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/final_test_by_id/final_test_by_id_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/final_test_course/final_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/finish_test/finish_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/lesson_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/listen_n_complete/listen_n_complete_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/listen_n_complete_words/listen_n_compelte_words_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/listen_n_selet_pairs/listen_n_select_pairs_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/multiple_choice_with_pictures/multiple_ch_with_pictures.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/select_pairs/selcet_pairs_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/test_by_id/single_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lessons/lesson_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/my_courses/my_course_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/rate_course/rate_course_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/set_video_time/set_video_time_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/start_course/start_course_bloc.dart';
import 'package:skills_xorijdaish/features/home/data/repository/home_repo_impl.dart';
import 'package:skills_xorijdaish/features/home/data/source/home_remote_data_source.dart';
import 'package:skills_xorijdaish/features/home/data/source/home_remote_data_source_impl.dart';
import 'package:skills_xorijdaish/features/home/domain/repository/home_repository.dart';
import 'package:skills_xorijdaish/features/home/domain/usecase/banners_use_case.dart';
import 'package:skills_xorijdaish/features/home/domain/usecase/notifications_count_use_case.dart';
import 'package:skills_xorijdaish/features/home/domain/usecase/notifications_use_case.dart';
import 'package:skills_xorijdaish/features/home/domain/usecase/read_all_use_case.dart';
import 'package:skills_xorijdaish/features/home/domain/usecase/read_one_use_case.dart';
import 'package:skills_xorijdaish/features/home/domain/usecase/serach_use_case.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/banners/banners_bloc.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/notifications/notif_bloc.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/notifications/notif_count/notif_count_bloc.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/notifications/read_all/read_all_bloc.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/notifications/read_one/read_one_bloc.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/search/search_bloc.dart';
import 'package:skills_xorijdaish/features/profile/data/repo/profile_repo_impl.dart';
import 'package:skills_xorijdaish/features/profile/data/source/profile_remote_data_source.dart';
import 'package:skills_xorijdaish/features/profile/data/source/profile_remote_data_source_impl.dart';
import 'package:skills_xorijdaish/features/profile/domain/repo/profile_repository.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/certificate_use_case.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/download_image.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/faqs_use_case.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/post_ticket_use_case.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/revoke_session_use_case.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/self_profile_use_case.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/send_message.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/session_use_case.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/support_use_case.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/tickets_message_use_case.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/update_avatar_use_case.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/certificate/certificate_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/create_ticket/create_ticket_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/download_image/download_image_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/faqs/faqs_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/revoke_session/revoke_session_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/self_info/self_info_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/send_message/send_message_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/sessions/session_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/support/support_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/tickets_message/tickets_message_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/update_avatar/update_avatar_bloc.dart';
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

import '../../features/courses/presentation/bloc/fetch_final_test/final_listen_n_complete/final_listen_n_complete_bloc.dart';
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
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );

  /// REPO
  sl.registerLazySingleton<CoursesRepository>(() => CoursesRepoImpl(sl()));
  sl.registerLazySingleton<ReelsRepository>(() => ReelsRepoImpl(sl()));
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepoImpl(sl()));
  sl.registerLazySingleton<StatsRepository>(() => StatsRepoImpl(sl()));
  sl.registerLazySingleton<HomeRepository>(() => HomeRepoImpl(sl()));

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
  sl.registerLazySingleton(() => PreTripByCountryUseCase(sl()));

  // tests
  sl.registerLazySingleton(() => AnswerToTestUseCase(sl()));
  sl.registerLazySingleton(() => SelectPairsUseCase(sl()));
  sl.registerLazySingleton(() => AnswerSelectPairsUseCase(sl()));
  sl.registerLazySingleton(() => FinishTestUseCase(sl()));
  sl.registerLazySingleton(() => FinalTestCourseUseCase(sl()));
  sl.registerLazySingleton(() => FinalTestByIdUseCase(sl()));
  sl.registerLazySingleton(() => ListenNCompleteUseCase(sl()));
  sl.registerLazySingleton(() => AnswerListenNCompleteUseCase(sl()));
  sl.registerLazySingleton(() => FillInTheBlankUseCase(sl()));
  sl.registerLazySingleton(() => ListenNCompleteWordsUseCase(sl()));
  sl.registerLazySingleton(() => MultipleChoiceWithPicturesUseCase(sl()));
  sl.registerLazySingleton(() => AnswerFillInTheBlankUseCase(sl()));
  sl.registerLazySingleton(() => ListenNSelectPairsUseCase(sl()));
  sl.registerLazySingleton(() => FinishFinalTestUseCase(sl()));

  /// Final tests answer
  sl.registerLazySingleton(() => AnswerFinalMultipleChoiceUseCase(sl()));
  sl.registerLazySingleton(() => AnsFinalListenNComplete(sl()));
  sl.registerLazySingleton(() => AnsFinalListenNCompleteWordsUseCase(sl()));
  sl.registerLazySingleton(() => AnsFinalFillInTheBlankUseCase(sl()));
  sl.registerLazySingleton(() => AnsFinalSelectPairsUseCase(sl()));
  sl.registerLazySingleton(
    () => AnsFinalMultipleChoiceWithPicturesUseCase(sl()),
  );

  //profile
  sl.registerLazySingleton(() => SelfProfileUseCase(sl()));
  sl.registerLazySingleton(() => SessionUseCase(sl()));
  sl.registerLazySingleton(() => RevokeSessionUseCase(sl()));
  sl.registerLazySingleton(() => SupportUseCase(sl()));
  sl.registerLazySingleton(() => PostTicketUseCase(sl()));
  sl.registerLazySingleton(() => CertificateUseCase(sl()));
  sl.registerLazySingleton(() => UpdateAvatarUseCase(sl()));

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
  sl.registerLazySingleton(() => LessonsByIdUseCase(sl()));

  // statistics
  sl.registerLazySingleton(() => AverageUseCase(sl()));
  sl.registerLazySingleton(() => WeekUseCase(sl()));
  sl.registerLazySingleton(() => CourseTimeUseCase(sl()));

  // notifications
  sl.registerLazySingleton(() => NotificationsUseCase(sl()));
  sl.registerLazySingleton(() => NotificationsCountUseCase(sl()));
  sl.registerLazySingleton(() => ReadAllUseCase(sl()));
  sl.registerLazySingleton(() => ReadOneUseCase(sl()));

  // search
  sl.registerLazySingleton(() => SearchUseCase(sl()));

  // set video time
  sl.registerLazySingleton(() => SetVideoTimeUseCase(sl()));

  // banners
  sl.registerLazySingleton(() => BannersUseCase(sl()));

  // tickets message
  sl.registerLazySingleton(() => TicketsMessageUseCase(sl()));

  // buy a course
  sl.registerLazySingleton(() => BuyCourseUseCase(sl()));

  // Tickets message / chat
  sl.registerLazySingleton(() => SendMessageUseCase(sl()));
  sl.registerLazySingleton(() => DownloadImageUseCase(sl()));

  // rate
  sl.registerLazySingleton(() => RateCourseUseCase(sl()));
  // final tests (all)
  sl.registerLazySingleton(() => FinalTestsRespUseCase(sl()));

  // face recognition
  sl.registerLazySingleton(() => FaceRecognitionMyIdUseCase(sl()));
  sl.registerLazySingleton(() => FaceRecognitionCompareUseCase(sl()));

  // FAQS
  sl.registerLazySingleton(() => FaqsUseCase(sl()));

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
  sl.registerLazySingleton(() => PreTripByCountryBloc(sl()));

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
  sl.registerLazySingleton(() => UpdateAvatarBloc(sl()));

  // lessons
  sl.registerLazySingleton(() => LessonsBloc(sl()));
  sl.registerLazySingleton(() => VideoBloc(sl()));
  sl.registerLazySingleton(() => FileBloc(sl()));
  sl.registerLazySingleton(() => LessonTestBloc(sl()));
  sl.registerLazySingleton(() => SingleTestBloc(sl()));
  sl.registerLazySingleton(() => StartCourseBloc(sl()));
  sl.registerLazySingleton(() => LessonByIdBloc(sl()));

  // test
  sl.registerLazySingleton(() => AnswerBloc(sl()));
  sl.registerLazySingleton(() => SelectPairsBloc(sl()));
  sl.registerLazySingleton(() => AnswerSelectPairsBloc(sl()));
  sl.registerLazySingleton(() => FinishTestBloc(sl()));
  sl.registerLazySingleton(() => FinalTestBloc(sl()));
  sl.registerLazySingleton(() => FinalTestByIdBloc(sl()));
  sl.registerLazySingleton(() => ListenNCompleteBloc(sl()));
  sl.registerLazySingleton(() => AnswerListenCompleteBloc(sl()));
  sl.registerLazySingleton(() => FillInTheBlankBloc(sl()));
  sl.registerLazySingleton(() => ListenNCompleteWordsBloc(sl()));
  sl.registerLazySingleton(() => MultipleChoiceWithPicturesBloc(sl()));
  sl.registerLazySingleton(() => AnswerFillInTheBlankBloc(sl()));
  sl.registerLazySingleton(() => ListenNSelectPairsBloc(sl()));
  sl.registerLazySingleton(() => FinishFinalTestBloc(sl()));

  /// Final tests answer
  sl.registerLazySingleton(() => FinalMultipleChoiceBloc(sl()));
  sl.registerLazySingleton(() => FinalListenNCompleteBloc(sl()));
  sl.registerLazySingleton(() => FinalFillInTheBlankBloc(sl()));
  sl.registerLazySingleton(() => FinalListenNCompleteWordsBloc(sl()));
  sl.registerLazySingleton(() => FinalSelectPairsBloc(sl()));
  sl.registerLazySingleton(() => FinalMultipleChoiceWithPicturesBloc(sl()));

  // statistics
  sl.registerLazySingleton(() => AverageBloc(sl()));
  sl.registerLazySingleton(() => WeekBloc(sl()));
  sl.registerLazySingleton(() => CourseTimeBloc(sl()));

  // notifications
  sl.registerLazySingleton(() => NotifBloc(sl()));
  sl.registerLazySingleton(() => NotifCountBloc(sl()));
  sl.registerLazySingleton(() => ReadAllBloc(sl()));
  sl.registerLazySingleton(() => ReadOneBloc(sl()));

  // search
  sl.registerLazySingleton(() => SearchBloc(sl()));

  // set video time
  sl.registerLazySingleton(() => SetVideoTimeBloc(sl()));

  // banners
  sl.registerLazySingleton(() => BannersBloc(sl()));

  // tickets message
  sl.registerLazySingleton(() => TicketsMessageBloc(sl()));

  // buy a course
  sl.registerLazySingleton(() => BuyCourseBloc(sl()));

  // Tickets message / chat
  sl.registerLazySingleton(() => SendMessageBloc(sl()));
  sl.registerLazySingleton(() => DownloadImageBloc(sl()));

  // rate
  sl.registerLazySingleton(() => RateCourseBloc(sl()));

  // final test (all)
  sl.registerLazySingleton(() => FetchFinalListenNCompleteBloc(sl()));
  sl.registerLazySingleton(() => FetchFinalFillInTheBlankBloc(sl()));
  sl.registerLazySingleton(() => FetchFinalListenNCompleteWordsBloc(sl()));
  sl.registerLazySingleton(
    () => FetchFinalMultipleChoiceWithPicturesBloc(sl()),
  );
  sl.registerLazySingleton(() => FetchFinalSelectPairsBloc(sl()));
  sl.registerLazySingleton(() => FetchFinalListenNSelectPairsBloc(sl()));

  // face recognition
  sl.registerLazySingleton(() => FaceRecMyIdBloc(sl()));
  sl.registerLazySingleton(() => FaceRecognitionCompareBloc(sl()));

  // FAQS
  sl.registerLazySingleton(() => FaqsBloc(sl()));
}
