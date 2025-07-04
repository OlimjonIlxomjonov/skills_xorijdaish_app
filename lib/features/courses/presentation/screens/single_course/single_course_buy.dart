import 'package:flutter/material.dart';
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
    final lessons = [
      {
        'title': "Rus tilini o‘rganamiz!",
        'progress': "16/20",
        'rating': 4,
        'status': 'done',
      },
      {
        'title': "Rus tilida zamonlar va ularni ishlatilishi",
        'progress': "16/20",
        'rating': 4,
        'status': 'done',
      },
      {
        'title': "Aviabilet harid qilish",
        'progress': "",
        'rating': 0,
        'status': 'active',
      },
      {
        'title': "Qonunchilik talablari",
        'progress': "",
        'rating': 0,
        'status': 'locked',
      },
      {
        'title': "Yakuniy test",
        'progress': "",
        'rating': 0,
        'status': 'locked',
      },
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: appH(20)),
        child: Column(
          children: List.generate(lessons.length, (index) {
            final lesson = lessons[index];
            final isLast = index == lessons.length - 1;

            Color circleColor;
            Widget innerIcon;

            switch (lesson['status']) {
              case 'done':
                circleColor = Colors.green;
                innerIcon = Icon(Icons.check, color: Colors.white, size: 18);
                break;
              case 'active':
                circleColor = Colors.yellow.shade700;
                innerIcon = Image.asset(AppImages.thumbnail, width: 24);
                break;
              default:
                circleColor = Colors.grey.shade300;
                innerIcon = const SizedBox.shrink();
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: appW(48),
                      height: appW(48),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: circleColor, width: 4),
                      ),
                      child: Center(child: innerIcon),
                    ),
                    if (!isLast)
                      Container(
                        width: 2,
                        height: appH(40),
                        color:
                            lesson['status'] == 'locked'
                                ? Colors.grey.shade300
                                : circleColor,
                      ),
                  ],
                ),
                SizedBox(width: appW(12)),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: appH(4)),
                    // padding: EdgeInsets.symmetric(vertical: appH(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lesson['title']! as String,
                          style: AppTextStyles.source.medium(
                            color:
                                lesson['status'] == 'locked'
                                    ? Colors.grey.shade400
                                    : AppColors.black,
                            fontSize: 16,
                          ),
                        ),
                        if (lesson['rating'] != 0) ...[
                          SizedBox(height: 8),
                          Row(
                            spacing: 24,
                            children: [
                              Row(
                                spacing: 8,
                                children: List.generate(5, (i) {
                                  return Icon(
                                    Icons.star,
                                    size: 16,
                                    color:
                                        i < (lesson['rating'] as int)
                                            ? Colors.amber
                                            : Colors.grey.shade300,
                                  );
                                }),
                              ),
                              Text(
                                lesson['progress']! as String,
                                style: AppTextStyles.source.regular(
                                  fontSize: 14,
                                  color: AppColors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Text buildText(String myText) {
    return Text(
      myText,
      style: AppTextStyles.source.medium(color: AppColors.black, fontSize: 14),
    );
  }
}
