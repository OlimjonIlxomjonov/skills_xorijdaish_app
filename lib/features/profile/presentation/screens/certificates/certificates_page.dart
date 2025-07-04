import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/certificates/sertification_details_screen.dart';

class CertificatesPage extends StatelessWidget {
  const CertificatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(titleText: 'Sertifikatlar'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: appW(12)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyScale.grey200,
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: ListTile(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    builder: (context) => const SertificationDetailsScreen(),
                  );
                },
                contentPadding: EdgeInsets.only(bottom: 2),
                leading: Container(
                  decoration: BoxDecoration(
                    color: AppColors.greyScale.grey100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Image.asset(AppImages.sertifikatPagePaper),
                ),
                title: Text(
                  'Rus tili (Potent)',
                  style: AppTextStyles.source.medium(
                    color: AppColors.black,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  spacing: 4,
                  children: [
                    SizedBox(height: appH(4)),
                    Row(
                      children: [
                        Text(
                          'Bajarilgan',
                          style: AppTextStyles.source.regular(
                            color: AppColors.textGrey,
                            fontSize: 12,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "100%",
                          style: AppTextStyles.source.regular(
                            color: AppColors.textGrey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      animation: true,
                      lineHeight: appH(8),
                      percent: 1,
                      backgroundColor: Colors.grey.shade200,
                      barRadius: Radius.circular(16),
                      progressColor: AppColors.secondBlue,
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
