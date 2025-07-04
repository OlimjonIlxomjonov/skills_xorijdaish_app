import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/splash/page/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsiveness.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      navigatorKey: AppRoute.navigatorKey,
    );
  }
}
