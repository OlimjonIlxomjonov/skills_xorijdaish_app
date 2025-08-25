import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/pre_trip_courses/price_info_entity.dart';

import '../../../../core/configs/assets/app_vectors.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';

class CourseCard extends StatelessWidget {
  final String image, text;
  final String richTextRate;
  final String richTextHours;
  final VoidCallback onTap;
  final bool isDone;
  final int? priceInfo;
  final bool isStarted;

  const CourseCard({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
    required this.richTextRate,
    required this.richTextHours,
    required this.isDone,
    this.priceInfo,
    required this.isStarted,
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
            SizedBox(
              height: appH(134),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: buildImage(),
                  ),
                  if (isDone)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: double.infinity,
                        height: appH(134),
                        color: Colors.black.withAlpha(150),
                        child: SvgPicture.asset(
                          AppVectors.certificate,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                  if (priceInfo != null)
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '$priceInfo UZS',
                          style: AppTextStyles.source.medium(
                            color: AppColors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: appH(8)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: AppTextStyles.source.medium(
                      color: AppColors.black,
                      fontSize: 15,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppVectors.star),
                      Text(
                        " $richTextRate",
                        style: AppTextStyles.source.medium(
                          color: AppColors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: appW(20)),
                      SvgPicture.asset(AppVectors.clock),
                      Text(
                        " $richTextHours",
                        style: AppTextStyles.source.medium(
                          color: AppColors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
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
                      isStarted ? 'Davom etish' : AppStrings.kursniBoshlash,
                      style: AppTextStyles.source.semiBold(
                        fontSize: 14,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return Image.network(
      image,
      width: double.infinity,
      height: appH(134),
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          height: appH(134),
          alignment: Alignment.center,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(color: Colors.white),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: appH(134),
          color: Colors.grey.shade200,
          alignment: Alignment.center,
          child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
        );
      },
    );
  }
}
