import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';

class SelfInformationPage extends StatelessWidget {
  const SelfInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(titleText: "Shaxsiy ma'lumotlar", onTap: () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: Column(
          spacing: 15,
          children: [
            infoFields('Foydalanuvchi FIO', "Afzal Pulatov G’ulomjon o’g’li"),
            infoFields('PNFL raqami', "54637835475857"),
            infoFields('Pasport seriya va raqami', "AA 1456754"),
            infoFields("Tug’ilgan sanasi", "19.09.2001"),
          ],
        ),
      ),
    );
  }

  Column infoFields(String text, hintText) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppTextStyles.source.medium(
            color: AppColors.textGrey,
            fontSize: 14,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.greyScale.grey50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: AppTextStyles.source.medium(
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
