import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final VoidCallback? onTap;

  const CustomAppBar({super.key, required this.titleText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        // leading: IconButton(
        //   onPressed: onTap,
        //   icon: Icon(IconlyLight.arrow_left),
        // ),
        title: Text(
          titleText,
          style: AppTextStyles.source.semiBold(
            color: AppColors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
