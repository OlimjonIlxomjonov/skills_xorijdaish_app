import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';

class AppNotifications extends StatelessWidget {
  const AppNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(titleText: 'Bildirishnomalar'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today',
              style: AppTextStyles.source.semiBold(
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(height: appH(20)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(color: AppColors.greyScale.grey50, blurRadius: 20),
                ],
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  width: appW(56),
                  height: appH(56),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.greyScale.grey100,
                  ),
                  child: Icon(
                    IconlyBold.wallet,
                    color: Color(0xff7875FC),
                    size: appH(28),
                  ),
                ),
                title: Text(
                  'Payment Successful!',
                  style: AppTextStyles.source.medium(
                    color: AppColors.black,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      "You’ve made a course payment",
                      style: AppTextStyles.source.regular(
                        color: Color(0xff0C1221),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
