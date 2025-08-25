import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_vectors.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import '../../../../core/common/constants/colors/app_colors.dart';
import '../../../../core/common/textstyles/app_text_styles.dart';

Widget testCardWithPicture(
  Color color,
  double size,
  String? text,
  String task,
  String audioUrl,
  bool isPlaying,
  VoidCallback onPressed,
  String imageUrl,
  bool isImageAvailable,
  bool isAudioAvailable,
) {
  return Container(
    width: size,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: AppColors.lightBlue.withOpacity(0.5),
          blurRadius: 12,
          offset: Offset(0, 10),
        ),
      ],
    ),
    child: Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              task,
              style: AppTextStyles.source.medium(
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
            isAudioAvailable
                ? IconButton(
                  onPressed: onPressed,
                  icon:
                      isPlaying
                          ? Icon(
                            Icons.stop,
                            color: Colors.white,
                            size: appW(30),
                          )
                          : SvgPicture.asset(
                            AppVectors.listen,
                            width: appW(30),
                            height: appH(30),
                          ),
                )
                : SizedBox.shrink(),
          ],
        ),
        Text(
          text ?? '',
          style: AppTextStyles.source.regular(
            color: AppColors.white,
            fontSize: 18,
          ),
        ),
        isImageAvailable ? Image.network(imageUrl) : SizedBox.shrink(),
      ],
    ),
  );
}
