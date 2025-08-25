import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/common/widgets/flush_bar/flush_bar_wg.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses/course_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses/course_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/my_courses/my_course_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/my_courses/my_course_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/country/choose_country_lessons.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/courses/foreign_languages_page.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/courses/skill_test.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/courses/soft_skills_page.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/single_course/single_course_page.dart';
import 'package:skills_xorijdaish/features/home/presentation/screens/search/search_page.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<CourseBloc>().add(getCoursesEvent());
    context.read<MyCourseBloc>().add(MyCoursesEvent());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List courseTitle = [
    'Xorij tillari',
    "Safar oldi ko'niktirish",
    'Soft skills',
    'Skill test',
  ];

  List coursePic = [
    AppImages.grandHat,
    AppImages.courseGlobe,
    AppImages.courseBook,
    AppImages.skillTest,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(titleText: 'Kurslarimiz'),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              AppRoute.go(SearchPage());
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: appW(20)),
              margin: EdgeInsets.symmetric(horizontal: appW(20)),
              height: appH(50),
              decoration: BoxDecoration(
                color: Color(0xffF7F7F8),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Icon(IconlyLight.search),
                  SizedBox(width: 10),
                  Text(
                    AppStrings.izlash,
                    style: AppTextStyles.source.regular(
                      color: AppColors.textGrey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: appH(20)),
          TabBar(
            controller: _tabController,
            indicator: UnderlineTabIndicator(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 4.0, color: AppColors.textBlue),
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
            tabs: const [
              Tab(text: 'Barcha kurslar'),
              Tab(text: 'Mening kurslarim'),
            ],
          ),
          SizedBox(height: appH(20)),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [_buildAllCourses(), _buildMyCourses()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllCourses() {
    return Column(
      children: [
        BlocBuilder<CourseBloc, CourseState>(
          builder: (context, state) {
            if (state is CourseLoading) {
              return Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: appW(20)),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .8,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: appH(10),
                          horizontal: appW(16),
                        ),
                        height: appH(64),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is CourseLoaded) {
              final courses = state.response.data.toList();
              return Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: appW(20),
                    right: appW(20),
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .8,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final title = courseTitle[index];
                    final pic = coursePic[index];
                    final course = courses[index];
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          AppRoute.go(
                            ForeignLanguagesPage(
                              cardTitle: 'foreign-languages',
                            ),
                          );
                        } else if (index == 1) {
                          AppRoute.go(ChooseCountryLessons());
                        } else if (index == 2) {
                          AppRoute.go(SoftSkillsPage(query: 'soft-skills'));
                        } else if (index == 3) {
                          AppRoute.go(SkillTestPage());
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              pic,
                              fit: BoxFit.fill,
                              width: appW(112),
                              height: appH(94),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              title,
                              style: AppTextStyles.source.semiBold(
                                color: AppColors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '⭐ ${course.stars} (${course.count} marta)',
                              style: AppTextStyles.source.regular(
                                color: AppColors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget _buildMyCourses() {
    return BlocConsumer<MyCourseBloc, MyCourseState>(
      builder: (context, state) {
        if (state is MyCourseLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MyCourseLoaded) {
          return ListView.builder(
            padding: EdgeInsets.only(left: appW(20), right: appW(20)),
            itemCount: state.response.data.length,
            itemBuilder: (context, index) {
              final my = state.response.data[index];
              return GestureDetector(
                onTap: () {
                  AppRoute.go(SingleCoursePage(courseId: my.id));
                },
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    left: 2,
                    right: 2,
                    top: 2,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: appW(16),
                    vertical: appH(15),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        spreadRadius: 1,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            my.title,
                            style: AppTextStyles.source.semiBold(
                              color: AppColors.black,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            formatDuration(my.seconds),
                            style: AppTextStyles.source.medium(
                              color: AppColors.textGrey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      CircularStepProgressIndicator(
                        totalSteps: 100,
                        currentStep: my.progress,
                        stepSize: 10,
                        selectedColor: AppColors.secondBlue,
                        unselectedColor: Colors.grey[200],
                        padding: 0,
                        width: appW(80),
                        height: appH(80),
                        selectedStepSize: 10,
                        roundedCap: (_, __) => true,
                        child: Center(
                          child: Text(
                            '${my.progress}%',
                            style: AppTextStyles.source.bold(
                              color: AppColors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return SizedBox.shrink();
      },
      listener: (context, state) {
        if (state is MyCourseError) {
          showErrorFlushbar(context, 'Internet aloqani tekshiring!');
        }
      },
    );
  }
}

String formatDuration(int seconds) {
  final duration = Duration(seconds: seconds);

  final weeks = duration.inDays ~/ 7;
  if (weeks > 0) return "$weeks hafta";

  final days = duration.inDays;
  if (days > 0) return "$days kun";

  final hours = duration.inHours;
  if (hours > 0) return "$hours soat";

  final minutes = duration.inMinutes;
  if (minutes > 0) return "$minutes daqiqa";

  return "${duration.inSeconds} soniya";
}
