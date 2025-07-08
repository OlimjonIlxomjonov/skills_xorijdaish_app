import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/soft_skills/soft_skills_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/countries/countries_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses/course_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/self_info/self_info_bloc.dart';
import 'package:skills_xorijdaish/features/reels/presentation/bloc/get_reels/reels_bloc.dart';

import 'core/di/service_locator.dart';
import 'features/courses/presentation/bloc/all_courses/foreign_language/foreign_bloc.dart';
import 'features/courses/presentation/bloc/all_courses/pre_trip_courses/pre_trip_bloc.dart';

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
      ],
      child: child,
    );
  }
}
