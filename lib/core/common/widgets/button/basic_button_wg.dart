import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';

class BasicButtonWg extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isEnabled;

  const BasicButtonWg({
    super.key,
    required this.text,
    required this.onTap,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15),
        minimumSize: Size(double.infinity, appH(51)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: isEnabled ? AppColors.appBg : Colors.grey.shade300,
      ),
      onPressed: isEnabled ? onTap : null,
      child: Text(
        text,
        style: AppTextStyles.source.medium(
          color: isEnabled ? AppColors.white : Colors.black45,
          fontSize: 16,
        ),
      ),
    );
  }
}
