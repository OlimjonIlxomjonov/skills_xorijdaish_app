import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:readmore/readmore.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/button/basic_button_wg.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';
import 'package:skills_xorijdaish/core/page_route/bottom_nav_wrapper.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/single_course/single_course_payment_page.dart';

import '../lessons/single_lesson_video.dart';

class SingleCourseBuy extends StatefulWidget {
  const SingleCourseBuy({super.key});

  @override
  State<SingleCourseBuy> createState() => _SingleCourseBuyState();
}

class _SingleCourseBuyState extends State<SingleCourseBuy>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavWrapper(initialIndex: 2, child: buildBody());
  }

  Column buildBody() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: appH(24), left: appW(10)),
          width: double.infinity,
          height: appH(300),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AppImages.singleCourse),
            ),
          ),
          child: SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  AppRoute.close();
                },
                icon: Icon(
                  IconlyLight.arrow_left,
                  color: AppColors.white,
                  size: appH(24),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: appW(24),
              right: appW(24),
              top: appH(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rossiya (Safar oldi ko'niktirish)",
                  style: AppTextStyles.source.medium(
                    color: AppColors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: appH(12)),
                Row(
                  spacing: appW(18),
                  children: [
                    buildText('⭐ 4.9'),
                    buildText('🕑 20 Soat'),
                    buildText('🎥 32 ta video'),
                    buildText('🌐 Ru'),
                  ],
                ),
                SizedBox(height: appH(18)),
                RichText(
                  text: TextSpan(
                    style: AppTextStyles.source.bold(
                      color: AppColors.secondBlue,
                      fontSize: 28,
                    ),
                    text: '620 000 UZS  ',
                    children: [
                      TextSpan(
                        text: '1 200 000 UZS',
                        style: AppTextStyles.source
                            .semiBold(color: AppColors.textGrey, fontSize: 18)
                            .copyWith(decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: appH(16)),
                TabBar(
                  controller: _tabController,
                  indicator: UnderlineTabIndicator(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(
                      width: 4.0,
                      color: AppColors.textBlue,
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 0),
                  ),
                  labelColor: AppColors.textBlue,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: AppTextStyles.source.semiBold(
                    fontSize: 16,
                    color: AppColors.grey,
                  ),
                  unselectedLabelStyle: AppTextStyles.source.regular(
                    fontSize: 16,
                    color: AppColors.appBg,
                  ),
                  tabs: const [Tab(text: "Ma'lumot"), Tab(text: 'Darslar')],
                ),
                SizedBox(height: appH(20)),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [_informationTab(), _lessonsTab()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _informationTab() {
    final ScrollController _scrollController = ScrollController();
    final ValueNotifier<bool> _showArrow = ValueNotifier(true);

    _scrollController.addListener(() {
      final isBottom =
          _scrollController.offset >=
          _scrollController.position.maxScrollExtent - 10;
      _showArrow.value = !isBottom;
    });

    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: EdgeInsets.only(bottom: appH(10)),
            child: Column(
              spacing: appH(18),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReadMoreText(
                  "Graffiti Drawing is the act of taking many different motifs and combining them together into one unified quilt...",
                  trimLines: 2,
                  colorClickableText: AppColors.textBlue,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' See more',
                  trimExpandedText: ' See less',
                  style: AppTextStyles.source.regular(
                    fontSize: 14,
                    color: AppColors.black,
                  ),
                  moreStyle: AppTextStyles.source.regular(
                    fontSize: 14,
                    color: AppColors.secondBlue,
                  ),
                  lessStyle: AppTextStyles.source.regular(
                    fontSize: 14,
                    color: AppColors.secondBlue,
                  ),
                ),
                Text(
                  "Bu kurs o'z ichiga oladi",
                  style: AppTextStyles.source.semiBold(
                    color: AppColors.black,
                    fontSize: 20,
                  ),
                ),
                for (int i = 0; i < 5; i++)
                  customListTile("Talab bo'yicha 2,5 soatlik video"),
                BasicButtonWg(
                  text: 'Sotib olish - 620 000 UZS',
                  onTap: () {
                    AppRoute.go(SingleCoursePaymentPage());
                  },
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: appH(8),
          // left: 10,
          right: 0,
          child: ValueListenableBuilder<bool>(
            valueListenable: _showArrow,
            builder: (_, show, __) {
              return AnimatedOpacity(
                opacity: show ? 1.0 : 0.0,
                duration: Duration(milliseconds: 100),
                child: Center(
                  child: Icon(
                    IconlyLight.arrow_down,
                    size: 28,
                    color: AppColors.grey,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget customListTile(String tileTitle) {
    return Row(
      spacing: appW(12),
      children: [
        Icon(IconlyLight.play),
        Text(
          tileTitle,
          style: AppTextStyles.source.regular(
            color: AppColors.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _lessonsTab() {
    final itemCount = 5;
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final isLast = index == itemCount - 1;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {
                index == 0 ? AppRoute.go(SingleLessonVideo()) : null;
              },
              contentPadding: EdgeInsets.zero,
              leading: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.mainGreen, width: 3),
                ),
                child: Image.asset(AppImages.thumbnail, fit: BoxFit.contain),
              ),
              title: Text(
                "Rus tili o'rganamiz!",
                style: AppTextStyles.source.medium(
                  color: AppColors.black,
                  fontSize: 16,
                ),
              ),
              subtitle: Row(
                spacing: 24,
                children: [
                  RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemSize: appH(12),
                    ignoreGestures: true,
                    itemBuilder:
                        (context, _) =>
                            Icon(IconlyBold.star, color: Colors.amber),
                    onRatingUpdate: (rating) {},
                  ),
                  Text(
                    '16/20',
                    style: AppTextStyles.source.medium(
                      color: AppColors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            if (!isLast)
              Container(
                margin: EdgeInsets.only(left: appW(27)),
                width: appW(3),
                height: appH(18),
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
          ],
        );
      },
    );
  }

  Text buildText(String myText) {
    return Text(
      myText,
      style: AppTextStyles.source.medium(color: AppColors.black, fontSize: 14),
    );
  }
}
