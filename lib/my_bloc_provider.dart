import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/skill_test/skill_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/soft_skills/soft_skills_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/countries/countries_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses/course_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_courses_by_id/course_by_id_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_file/file_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_video/video_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/answer_to_test/answer_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/lesson_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/test_by_id/single_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lessons/lesson_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/my_courses/my_course_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/start_course/start_course_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/certificate/certificate_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/create_ticket/create_ticket_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/revoke_session/revoke_session_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/self_info/self_info_bloc.dart';
import 'package:skills_xorijdaish/features/reels/presentation/bloc/get_reels/reels_bloc.dart';
import 'package:skills_xorijdaish/features/reels/presentation/bloc/put_like/like_bloc.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/average/average_bloc.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/course/course_time_bloc.dart';

import 'core/di/service_locator.dart';
import 'features/courses/presentation/bloc/all_courses/foreign_language/foreign_bloc.dart';
import 'features/courses/presentation/bloc/all_courses/pre_trip_courses/pre_trip_bloc.dart';
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
      ],
      child: child,
    );
  }
}
