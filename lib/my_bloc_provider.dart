import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/countries/countries_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses/course_bloc.dart';

import 'core/di/service_locator.dart';

class MyBlocProvider extends StatelessWidget {
  final Widget child;

  const MyBlocProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /// Countries
        BlocProvider<CountriesBloc>(create: (context) => sl<CountriesBloc>()),
        BlocProvider<CourseBloc>(create: (context) => sl<CourseBloc>()),
      ],
      child: child,
    );
  }
}
