import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/lessons_page.dart';

import '../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../core/common/constants/strings/app_strings.dart';
import '../../../../../core/common/textstyles/app_text_styles.dart';
import '../../../../../core/common/textstyles/sans_text_style.dart';
import '../../../../../core/common/widgets/button/basic_button_wg.dart';
import '../../../../../core/configs/assets/app_images.dart';
import '../../../../../core/page_route/route_generator.dart';
import '../../../../../core/utils/responsiveness/app_responsive.dart';

class ChooseCountryLessons extends StatefulWidget {
  const ChooseCountryLessons({super.key});

  @override
  State<ChooseCountryLessons> createState() => _ChooseCountryLessonsState();
}

class _ChooseCountryLessonsState extends State<ChooseCountryLessons> {
  int itemSelected = 0;

  // bool itemSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        toolbarHeight: appH(100),
        title: Row(
          children: [
            CircleAvatar(
              radius: appH(30),
              backgroundImage: AssetImage(AppImages.userAvatar),
            ),
            SizedBox(width: appW(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${AppStrings.hayrliKun} 👋',
                  style: AppTextStyles.source.medium(
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: appH(10)),
                Text(
                  'Afzal Pulatov',
                  style: SansTextStyle().semiBold(
                    color: AppColors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 4,
                itemBuilder: (context, index) {
                  final isSelected = itemSelected == index;
                  return Container(
                    padding: EdgeInsets.symmetric(
                      vertical: appH(10),
                      horizontal: appW(16),
                    ),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color:
                          isSelected
                              ? AppColors.secondBlue
                              : Color(0xff080E1E0D),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            itemSelected = index;
                          });
                        },
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundColor: AppColors.grey,
                          // backgroundImage: NetworkImage(country.iconUrl),
                          radius: 25,
                        ),
                        title: Text(
                          'English',
                          style: AppTextStyles.source.medium(
                            color:
                                isSelected ? AppColors.white : AppColors.black,
                            fontSize: 16,
                          ),
                        ),
                        trailing: Icon(
                          isSelected ? IconlyBold.tick_square : null,
                          color: AppColors.white,
                          size: appH(24),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: appH(24)),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 10,
              color: Colors.grey.shade200,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: BasicButtonWg(
          text: AppStrings.contunie,
          onTap: () {
            AppRoute.go(LessonsPage());
          },
        ),
      ),
    );
  }
}
