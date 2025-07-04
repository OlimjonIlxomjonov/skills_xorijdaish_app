import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/textstyles/font_family.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';

class SansTextStyle extends AppTextStyles {
  @override
  TextStyle bold({required Color color, required double fontSize}) => TextStyle(
    fontSize: AppResponsiveness.height(fontSize),
    color: color,
    fontWeight: FontWeight.bold,
    fontFamily: FontFamily.sourceSans,
  );

  @override
  TextStyle semiBold({required Color color, required double fontSize}) =>
      TextStyle(
        fontSize: AppResponsiveness.width(fontSize),
        color: color,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.sourceSans,
      );

  @override
  TextStyle medium({required Color color, required double fontSize}) =>
      TextStyle(
        fontSize: AppResponsiveness.height(fontSize),
        color: color,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.sourceSans,
      );

  @override
  TextStyle regular({required Color color, required double fontSize}) =>
      TextStyle(
        fontSize: AppResponsiveness.height(fontSize),
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.sourceSans,
      );
}
