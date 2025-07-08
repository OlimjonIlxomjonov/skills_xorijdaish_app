import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/textstyles/sans_text_style.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/courses_page.dart';
import 'package:skills_xorijdaish/features/home/presentation/screens/home/notifications/app_notifications.dart';
import 'package:skills_xorijdaish/features/home/presentation/screens/search/search_page.dart';
import 'package:skills_xorijdaish/features/one_id_web_view.dart';

import '../../../../../core/utils/responsiveness/app_responsive.dart';
import '../../widgets/course_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final List<String> options = [
    '🔥 Barchasi',
    '🌐 Xorij tillar',
    '✈️ Safar oldi koniktirish',
  ];

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
        actions: [
          IconButton(
            icon: Icon(IconlyLight.notification, size: appH(28)),
            onPressed: () {
              AppRoute.go(AppNotifications());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                spacing: 16,
                children: [
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () {
                        AppRoute.go(SearchPage());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: appH(50),
                        decoration: BoxDecoration(
                          color: Color(0xffF7F7F8),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          spacing: 12,
                          children: [
                            // SizedBox(width: appW(10)),
                            Icon(IconlyLight.search),
                            Text(
                              AppStrings.izlash,
                              style: AppTextStyles.source.regular(
                                color: Color(0xff0C1221),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, appH(48)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        backgroundColor: AppColors.appBg,
                        foregroundColor: AppColors.white,
                      ),
                      child: Icon(IconlyLight.filter, size: 24),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: appH(210),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset(AppImages.saleAdvert),
                  Image.asset(AppImages.saleAdvert),
                  Image.asset(AppImages.saleAdvert),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.kurslarimiz,
                        style: AppTextStyles.source.semiBold(
                          color: AppColors.black,
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          overlayColor: Colors.transparent,
                        ),
                        onPressed: () {
                          AppRoute.go(CoursesPage());
                        },
                        child: Text(
                          AppStrings.barchasi,
                          style: AppTextStyles.source.medium(
                            color: AppColors.textGrey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: appH(40),
                  child: ListView.builder(
                    padding: EdgeInsets.only(right: appW(12)),
                    itemCount: options.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: appW(12)),
                        child: ChoiceChip(
                          label: Text(
                            options[index],
                            style: AppTextStyles.source.regular(
                              color:
                                  selectedIndex == index
                                      ? AppColors.white
                                      : Color(0xff0C1221),
                              fontSize: 13,
                            ),
                          ),
                          selected: selectedIndex == index,
                          selectedColor: AppColors.secondBlue,
                          backgroundColor: AppColors.white,
                          showCheckmark: false,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color:
                                  selectedIndex == index
                                      ? AppColors.secondBlue
                                      : Color(0xff0C12211A),
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          onSelected: (selected) {
                            setState(() {
                              selectedIndex = selected ? index : selectedIndex;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: appH(295),
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CourseCard(
                        image: AppImages.rusTiliKursi,
                        text: 'Rus tili (Patent)',
                        onTap: () {},
                        richTextRate: '⭐ 4.9  ',
                        richTextHours: '  🕑 40 Soat',
                      );
                    },
                  ),
                ),
                SizedBox(height: appH(10)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
