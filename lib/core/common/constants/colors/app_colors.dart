import 'package:flutter/material.dart';

abstract class AppColors {
  static const greyScale = _GreyScale();

  static const Color greyBg = Color(0xffADD8E6);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff0C1221);
  static const Color appBg = Color(0xff003F97);
  static const Color grey = Color(0xff767676);
  static const Color textGrey = Color(0xff9E9E9E);
  static const Color inputGreyColor = Color(0xffD8DADC);

  // static const Color greyScale500 = Color(0xff64748B);

  static const Color textBlue = Color(0xff003399);
  static const Color secondBlue = Color(0xff00D2FF);

  static const Color secondary = Color(0xFFFFD300);
  static const Color red = Color(0xFFFF5757);
  static const Color pink = Color(0xFFE91E63);
  static const Color purple = Color(0xFF9775FA);
  static const Color deepPurple = Color(0xFF673AB7);
  static const Color indigo = Color(0xFF4267B2);
  static const Color blue = Color(0xFF2196F3);
  static const Color lightBlue = Color(0xFF1DA1F2);
  static const Color cyan = Color(0xFF00BCD4);
  static const Color teal = Color(0xFF009688);
  static const Color green = Color(0xFF4CAF50);
  static const Color lightGreen = Color(0xFF8BC34A);
  static const Color lime = Color(0xFFCDDC39);
  static const Color yellow = Color(0xFFFFEB3B);
  static const Color amber = Color(0xFFFFC107);
  static const Color orange = Color(0xFFFF9800);
  static const Color deepOrange = Color(0xFFEA4335);
  static const Color brown = Color(0xFF795548);
  static const Color blueGrey = Color(0xFF607D8B);

  /// Lessons progress indicator
  static const Color mainGreen = Color(0xff24CF81);
  static const Color progressYellow = Color(0xffFFD700);
  static const Color progressGrey = Color(0xffDAE1E9);
}

class _GreyScale {
  const _GreyScale();

  final Color grey900 = const Color(0xFF212121);
  final Color grey800 = const Color(0xFF424242);
  final Color grey700 = const Color(0xFF616161);
  final Color grey600 = const Color(0xFF757575);
  final Color grey500 = const Color(0xFF9E9E9E);
  final Color grey400 = const Color(0xFFBDBDBD);
  final Color grey300 = const Color(0xFFE0E0E0);
  final Color grey200 = const Color(0xFFEEEEEE);
  final Color grey100 = const Color(0xFFF5F5F5);
  final Color grey50 = const Color(0xFFFAFAFA);
}
