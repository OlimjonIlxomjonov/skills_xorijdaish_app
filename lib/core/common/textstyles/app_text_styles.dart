import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/common/textstyles/sans_text_style.dart';

abstract class AppTextStyles {
  static final SansTextStyle source = SansTextStyle();

  TextStyle bold({required Color color, required double fontSize});

  TextStyle semiBold({required Color color, required double fontSize});

  TextStyle medium({required Color color, required double fontSize});

  TextStyle regular({required Color color, required double fontSize});
}
