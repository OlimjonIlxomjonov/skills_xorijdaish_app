import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../features/courses/presentation/screens/single_course/single_course_buy.dart';
import '../../../page_route/route_generator.dart';
import '../../../utils/responsiveness/app_responsive.dart';
import '../../constants/colors/app_colors.dart';
import '../../constants/strings/app_strings.dart';
import '../../textstyles/app_text_styles.dart';
import '../button/basic_button_wg.dart';

class LessonsListWg extends StatelessWidget {
  final String title;
  final int fileCount;
  final String stars;
  final String image;
  final int videoCount;

  const LessonsListWg({
    super.key,
    required this.title,
    required this.fileCount,
    required this.stars,
    required this.image,
    required this.videoCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 9, bottom: 16),
      margin: EdgeInsets.only(bottom: appH(20)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.network(
              image,
              width: appW(372),
              height: appH(164),
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: appW(372),
                  height: appH(164),
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
                  width: appW(372),
                  height: appH(164),
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
          Text(
            // 'Til (Basic)',
            title,
            style: AppTextStyles.source.semiBold(
              color: AppColors.black,
              fontSize: 16,
            ),
          ),
          Text(
            '⭐ $stars    📄 $fileCount fayl    ▶ ️${videoCount}ta video',
            style: AppTextStyles.source.medium(
              color: AppColors.black,
              fontSize: 13,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 1,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(12, 18, 33, 0.0),
                  Color.fromRGBO(12, 18, 33, 0.2),
                  Color.fromRGBO(12, 18, 33, 0.0),
                ],
                stops: [0.0, 0.5043, 1.0],
              ),
            ),
          ),
          BasicButtonWg(
            text: AppStrings.start,
            onTap: () {
              AppRoute.go(SingleCourseBuy());
            },
          ),
        ],
      ),
    );
  }
}
