import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';

import '../../../../core/utils/responsiveness/app_responsive.dart';

class CourseCard extends StatelessWidget {
  final String image, text;
  final String richTextRate;
  final String richTextHours;
  final VoidCallback onTap;

  const CourseCard({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
    required this.richTextRate,
    required this.richTextHours,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: appW(230),
      margin: EdgeInsets.only(left: appW(20), top: appH(10), bottom: appH(10)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                width: double.infinity,
                height: appH(134),
                image,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: appH(134),
                    alignment: Alignment.center,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: appH(10),
                          horizontal: appW(16),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: appH(134),
                    color: Colors.grey.shade200,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.broken_image,
                      size: 40,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: appH(12)),
            Text(
              text,
              style: AppTextStyles.source.medium(
                color: AppColors.black,
                fontSize: 15,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: appH(10)),
            RichText(
              text: TextSpan(
                text: richTextRate,
                style: AppTextStyles.source.medium(
                  color: Color(0xff0C1221),
                  fontSize: 14,
                ),
                children: [
                  TextSpan(
                    text: '  $richTextHours',
                    style: AppTextStyles.source.medium(
                      color: Color(0xff0C1221),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.appBg,
                foregroundColor: AppColors.white,
                minimumSize: Size(double.infinity, appH(40)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              child: Text(
                AppStrings.kursniBoshlash,
                style: AppTextStyles.source.semiBold(
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
