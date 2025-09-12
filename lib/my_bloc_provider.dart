import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/buy_course/buy_course_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/pre_trip_by_country/pre_trip_by_country_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/skill_test/skill_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/soft_skills/soft_skills_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/countries/countries_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses/course_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/filil_in_the_blank/fetch_final_fill_in_the_blank_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/final_listen_n_complete/final_listen_n_complete_bloc.dart';
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
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_video/video_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_by_id/lesson_by_id_bloc.dart';
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
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/select_pairs/selcet_pairs_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/test_by_id/single_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lessons/lesson_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/my_courses/my_course_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/rate_course/rate_course_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/set_video_time/set_video_time_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/start_course/start_course_bloc.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/banners/banners_bloc.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/notifications/notif_bloc.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/notifications/notif_count/notif_count_bloc.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/notifications/read_all/read_all_bloc.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/search/search_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/certificate/certificate_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/create_ticket/create_ticket_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/download_image/download_image_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/faqs/faqs_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/revoke_session/revoke_session_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/self_info/self_info_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/send_message/send_message_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/tickets_message/tickets_message_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/update_avatar/update_avatar_bloc.dart';
import 'package:skills_xorijdaish/features/reels/presentation/bloc/get_reels/reels_bloc.dart';
import 'package:skills_xorijdaish/features/reels/presentation/bloc/put_like/like_bloc.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/average/average_bloc.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/course/course_time_bloc.dart';

import 'core/di/service_locator.dart';
import 'features/courses/presentation/bloc/all_courses/foreign_language/foreign_bloc.dart';
import 'features/courses/presentation/bloc/all_courses/pre_trip_courses/pre_trip_bloc.dart';
import 'features/courses/presentation/bloc/face_recognation/face_recognition_compare/face_recognition_compare_bloc.dart';
import 'features/courses/presentation/bloc/face_recognation/face_recognition_my_id/face_rec_my_id_bloc.dart';
import 'features/courses/presentation/bloc/lesson_tests/answer_fill_in_the_blank/answer_fill_in_the_blank_bloc.dart';
import 'features/courses/presentation/bloc/lesson_tests/multiple_choice_with_pictures/multiple_ch_with_pictures.dart';
import 'features/profile/presentation/bloc/sessions/session_bloc.dart';
import 'features/profile/presentation/bloc/support/support_bloc.dart';
import 'features/statistics/presentation/bloc/weekly/week_bloc.dart';

class MyBlocProvider extends StatelessWidget {
  final Widget child;

  const MyBlocProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountriesBloc>(create: (context) => sl<CountriesBloc>()),
        BlocProvider<CourseBloc>(create: (context) => sl<CourseBloc>()),
        BlocProvider<SoftSkillsBloc>(create: (context) => sl<SoftSkillsBloc>()),
        BlocProvider<ForeignBloc>(create: (context) => sl<ForeignBloc>()),
        BlocProvider<PreTripBloc>(create: (context) => sl<PreTripBloc>()),
        BlocProvider<ReelsBloc>(create: (context) => sl<ReelsBloc>()),
        BlocProvider<SelfInfoBloc>(create: (context) => sl<SelfInfoBloc>()),
        BlocProvider<LikeBloc>(create: (context) => sl<LikeBloc>()),
        BlocProvider<LessonsBloc>(create: (context) => sl<LessonsBloc>()),
        BlocProvider<VideoBloc>(create: (context) => sl<VideoBloc>()),
        BlocProvider<FileBloc>(create: (context) => sl<FileBloc>()),
        BlocProvider<SessionBloc>(create: (context) => sl<SessionBloc>()),
        BlocProvider<SkillTestBloc>(create: (context) => sl<SkillTestBloc>()),
        BlocProvider<CourseByIdBloc>(create: (context) => sl<CourseByIdBloc>()),
        BlocProvider<MyCourseBloc>(create: (context) => sl<MyCourseBloc>()),
        BlocProvider<LessonTestBloc>(create: (context) => sl<LessonTestBloc>()),
        BlocProvider<SingleTestBloc>(create: (context) => sl<SingleTestBloc>()),
        BlocProvider<StartCourseBloc>(
          create: (context) => sl<StartCourseBloc>(),
        ),
        BlocProvider<AverageBloc>(create: (context) => sl<AverageBloc>()),
        BlocProvider<WeekBloc>(create: (context) => sl<WeekBloc>()),
        BlocProvider<CourseTimeBloc>(create: (context) => sl<CourseTimeBloc>()),
        BlocProvider<RevokeSessionBloc>(
          create: (context) => sl<RevokeSessionBloc>(),
        ),
        BlocProvider<SupportBloc>(create: (context) => sl<SupportBloc>()),
        BlocProvider<CreateTicketBloc>(
          create: (context) => sl<CreateTicketBloc>(),
        ),
        BlocProvider<CertificateBloc>(
          create: (context) => sl<CertificateBloc>(),
        ),
        BlocProvider<AnswerBloc>(create: (context) => sl<AnswerBloc>()),
        BlocProvider<SelectPairsBloc>(
          create: (context) => sl<SelectPairsBloc>(),
        ),
        BlocProvider<AnswerSelectPairsBloc>(
          create: (context) => sl<AnswerSelectPairsBloc>(),
        ),
        BlocProvider<NotifBloc>(create: (context) => sl<NotifBloc>()),
        BlocProvider<FinishTestBloc>(create: (context) => sl<FinishTestBloc>()),
        BlocProvider<FinalTestBloc>(create: (context) => sl<FinalTestBloc>()),
        BlocProvider<FinalTestByIdBloc>(
          create: (context) => sl<FinalTestByIdBloc>(),
        ),
        BlocProvider<UpdateAvatarBloc>(
          create: (context) => sl<UpdateAvatarBloc>(),
        ),
        BlocProvider<SearchBloc>(create: (context) => sl<SearchBloc>()),
        BlocProvider<PreTripByCountryBloc>(
          create: (context) => sl<PreTripByCountryBloc>(),
        ),
        BlocProvider<NotifCountBloc>(create: (context) => sl<NotifCountBloc>()),
        BlocProvider<ReadAllBloc>(create: (context) => sl<ReadAllBloc>()),
        BlocProvider<ListenNCompleteBloc>(
          create: (context) => sl<ListenNCompleteBloc>(),
        ),
        BlocProvider<AnswerListenCompleteBloc>(
          create: (context) => sl<AnswerListenCompleteBloc>(),
        ),
        BlocProvider<BannersBloc>(create: (context) => sl<BannersBloc>()),

        BlocProvider<SetVideoTimeBloc>(
          create: (context) => sl<SetVideoTimeBloc>(),
        ),
        BlocProvider<FillInTheBlankBloc>(
          create: (context) => sl<FillInTheBlankBloc>(),
        ),

        BlocProvider<ListenNCompleteWordsBloc>(
          create: (context) => sl<ListenNCompleteWordsBloc>(),
        ),
        BlocProvider<MultipleChoiceWithPicturesBloc>(
          create: (context) => sl<MultipleChoiceWithPicturesBloc>(),
        ),
        BlocProvider<AnswerFillInTheBlankBloc>(
          create: (context) => sl<AnswerFillInTheBlankBloc>(),
        ),
        BlocProvider<ListenNSelectPairsBloc>(
          create: (context) => sl<ListenNSelectPairsBloc>(),
        ),
        BlocProvider<LessonByIdBloc>(create: (context) => sl<LessonByIdBloc>()),
        BlocProvider<TicketsMessageBloc>(
          create: (context) => sl<TicketsMessageBloc>(),
        ),

        /// FINAL TEST
        // finish test
        BlocProvider<FinishFinalTestBloc>(
          create: (context) => sl<FinishFinalTestBloc>(),
        ),

        // tests answer
        BlocProvider<FinalMultipleChoiceBloc>(
          create: (context) => sl<FinalMultipleChoiceBloc>(),
        ),
        BlocProvider<FinalListenNCompleteBloc>(
          create: (context) => sl<FinalListenNCompleteBloc>(),
        ),
        BlocProvider<BuyCourseBloc>(create: (context) => sl<BuyCourseBloc>()),
        BlocProvider<FinalFillInTheBlankBloc>(
          create: (context) => sl<FinalFillInTheBlankBloc>(),
        ),
        BlocProvider<FinalListenNCompleteWordsBloc>(
          create: (context) => sl<FinalListenNCompleteWordsBloc>(),
        ),
        BlocProvider<FinalSelectPairsBloc>(
          create: (context) => sl<FinalSelectPairsBloc>(),
        ),
        BlocProvider<FinalMultipleChoiceWithPicturesBloc>(
          create: (context) => sl<FinalMultipleChoiceWithPicturesBloc>(),
        ),
        BlocProvider<SendMessageBloc>(
          create: (context) => sl<SendMessageBloc>(),
        ),
        BlocProvider<DownloadImageBloc>(
          create: (context) => sl<DownloadImageBloc>(),
        ),
        BlocProvider<RateCourseBloc>(create: (context) => sl<RateCourseBloc>()),

        // fetch tests
        BlocProvider<FetchFinalListenNCompleteBloc>(
          create: (context) => sl<FetchFinalListenNCompleteBloc>(),
        ),
        BlocProvider<FetchFinalFillInTheBlankBloc>(
          create: (context) => sl<FetchFinalFillInTheBlankBloc>(),
        ),
        BlocProvider<FetchFinalListenNCompleteWordsBloc>(
          create: (context) => sl<FetchFinalListenNCompleteWordsBloc>(),
        ),
        BlocProvider<FetchFinalMultipleChoiceWithPicturesBloc>(
          create: (context) => sl<FetchFinalMultipleChoiceWithPicturesBloc>(),
        ),
        BlocProvider<FetchFinalSelectPairsBloc>(
          create: (context) => sl<FetchFinalSelectPairsBloc>(),
        ),
        BlocProvider<FetchFinalListenNSelectPairsBloc>(
          create: (context) => sl<FetchFinalListenNSelectPairsBloc>(),
        ),
        BlocProvider<FaceRecMyIdBloc>(
          create: (context) => sl<FaceRecMyIdBloc>(),
        ),
        BlocProvider<FaceRecognitionCompareBloc>(
          create: (context) => sl<FaceRecognitionCompareBloc>(),
        ),
        BlocProvider<FaqsBloc>(create: (context) => sl<FaqsBloc>()),
      ],
      child: child,
    );
  }
}
