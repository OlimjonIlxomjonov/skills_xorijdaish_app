import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:iconly/iconly.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';

void warningBarWg(BuildContext context, String message) {
  Flushbar(
    messageText: Text(
      message,
      style: AppTextStyles.source.semiBold(
        color: AppColors.white,
        fontSize: 16,
      ),
    ),
    backgroundColor: Colors.grey,
    duration: const Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
    icon: Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
      ),
      child: const Icon(IconlyLight.hide, color: AppColors.grey),
    ),
    margin: const EdgeInsets.all(8),
    padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
    borderRadius: BorderRadius.circular(8),
  ).show(context);
}
