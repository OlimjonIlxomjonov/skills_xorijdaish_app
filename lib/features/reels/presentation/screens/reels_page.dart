import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(IconlyLight.arrow_left),
                  Text(
                    AppStrings.videos,
                    style: AppTextStyles.source.semiBold(
                      color: AppColors.black,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ),
          Container(child: Center(child: Icon(IconlyLight.play))),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: appW(300),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Rus tili (Potent)',
                  style: AppTextStyles.source.bold(
                    color: AppColors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: appH(12)),
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  'Lorem ipsum dolor sit amet consectetur. Consequat id porttitor mauris ut amet orci dolor. Nibh mauris gravida quis gravida morbi magna.',
                  style: AppTextStyles.source.regular(
                    color: AppColors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    icon: Icon(
                      isLiked ? IconlyBold.heart : IconlyLight.heart,
                      size: appH(32),
                      color: isLiked ? AppColors.red : AppColors.black,
                    ),
                  ),
                  Text('12.267'),
                  SizedBox(height: appH(28)),
                  Icon(IconlyBold.show, size: appH(32), color: AppColors.black),
                  Text('12.267'),
                  SizedBox(height: appH(28)),
                  Icon(IconlyBold.send, size: appH(32), color: AppColors.black),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
