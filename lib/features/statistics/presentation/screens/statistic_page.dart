import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(titleText: 'Statistika', onTap: () {}),
      body: Padding(
        padding: EdgeInsets.only(left: appW(20), right: appW(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.activeSessions,
              style: AppTextStyles.source.medium(
                color: AppColors.black,
                fontSize: 18,
              ),
            ),
            Text(
              '3 soat 58 daqiqa',
              style: AppTextStyles.source.semiBold(
                color: AppColors.black,
                fontSize: 28,
              ),
            ),
            Text(
              AppStrings.dailyMidActive,
              style: AppTextStyles.source.regular(
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
