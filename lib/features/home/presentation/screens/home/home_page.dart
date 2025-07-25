import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/textstyles/sans_text_style.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_vectors.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/soft_skills/soft_skills_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses/course_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses/course_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/courses_page.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/single_course/single_course_page.dart';
import 'package:skills_xorijdaish/features/home/presentation/screens/home/notifications/app_notifications.dart';
import 'package:skills_xorijdaish/features/home/presentation/screens/search/search_page.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/self_info/self_info_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/self_information/user_info_storage.dart';
import '../../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../courses/presentation/bloc/all_courses/foreign_language/foreign_bloc.dart';
import '../../../../courses/presentation/bloc/all_courses/foreign_language/foreign_state.dart';
import '../../../../courses/presentation/bloc/all_courses/pre_trip_courses/pre_trip_bloc.dart';
import '../../../../courses/presentation/bloc/all_courses/pre_trip_courses/pre_trip_state.dart';
import '../../../../courses/presentation/bloc/all_courses/skill_test/skill_test_bloc.dart';
import '../../../../courses/presentation/bloc/all_courses/skill_test/skill_test_state.dart';
import '../../../../courses/presentation/bloc/all_courses/soft_skills/soft_skills_state.dart';
import '../../widgets/course_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final List<String> options = [
    'Barchasi',
    'Xorij tillar',
    'Safar oldi koniktirish',
    'Soft skills',
    'Skill test',
  ];

  final List<Widget> iconOptions = [
    Text('🔥'),
    SvgPicture.asset(AppVectors.global, color: AppColors.black),
    SvgPicture.asset(AppVectors.airaport, color: AppColors.black),
    SvgPicture.asset(AppVectors.global, color: AppColors.black),
    Icon(IconlyLight.document),
  ];

  @override
  void initState() {
    super.initState();
    context.read<CourseBloc>().add(getCoursesEvent());
    context.read<ForeignBloc>().add(
      GetForeignLanguageEvent('foreign-languages'),
    );
    context.read<PreTripBloc>().add(PreTripEvent('pre-trip-courses'));
    context.read<SoftSkillsBloc>().add(GetSoftSkillsEvent('soft-skills'));
    context.read<SkillTestBloc>().add(SkillTestEvent('skill-test'));
  }

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
              backgroundImage:
                  userInfo.avatarImage != null
                      ? FileImage(userInfo.avatarImage!)
                      : AssetImage(AppImages.defaultProfilePic),
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
                  userInfo.fullName ?? "Label",
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                BlocBuilder<CourseBloc, CourseState>(
                  builder: (context, state) {
                    if (state is CourseLoading) {
                      return SizedBox(
                        height: appH(40),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: appW(20),
                                bottom: appH(20),
                              ),
                              child: Container(
                                height: appH(36),
                                width: appW(111),
                                alignment: Alignment.center,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: appH(20),
                                      horizontal: appW(16),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else if (state is CourseError) {
                      return Text('Error');
                    } else if (state is CourseLoaded) {
                      return SizedBox(
                        height: appH(40),
                        child: ListView.builder(
                          padding: EdgeInsets.only(right: appW(12)),
                          itemCount: options.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: appW(12)),
                              child: ChoiceChip(
                                label: Row(
                                  spacing: 10,
                                  children: [
                                    iconOptions[index],
                                    Text(
                                      options[index],
                                      style: AppTextStyles.source.regular(
                                        color:
                                            selectedIndex == index
                                                ? AppColors.white
                                                : Color(0xff0C1221),
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                selected: selectedIndex == index,
                                selectedColor: AppColors.appBg,
                                backgroundColor: AppColors.white,
                                showCheckmark: false,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color:
                                        selectedIndex == index
                                            ? AppColors.appBg
                                            : Color(0xff0C12211A),
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                onSelected: (selected) {
                                  setState(() {
                                    selectedIndex =
                                        selected ? index : selectedIndex;
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
                Builder(
                  builder: (context) {
                    if (selectedIndex == 0) {
                      return BlocBuilder<ForeignBloc, ForeignState>(
                        builder: (context, foreignState) {
                          return BlocBuilder<PreTripBloc, PreTripState>(
                            builder: (context, preTripState) {
                              return BlocBuilder<
                                SoftSkillsBloc,
                                SoftSkillsState
                              >(
                                builder: (context, softSkillsState) {
                                  return BlocBuilder<
                                    SkillTestBloc,
                                    SkillTestState
                                  >(
                                    builder: (context, skillTestState) {
                                      final allCourses = <dynamic>[];

                                      if (foreignState is ForeignLoaded) {
                                        allCourses.addAll(
                                          foreignState.response.data,
                                        );
                                      }
                                      if (preTripState is PreTripLoaded) {
                                        allCourses.addAll(
                                          preTripState.response.data,
                                        );
                                      }
                                      if (softSkillsState is SoftSkillsLoaded) {
                                        allCourses.addAll(
                                          softSkillsState.softSkills.data,
                                        );
                                      }
                                      if (skillTestState is SkillTestLoaded) {
                                        allCourses.add(skillTestState.response);
                                      }

                                      if (allCourses.isEmpty) {
                                        return SizedBox(
                                          height: appH(277),
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 3,
                                            itemBuilder: (context, index) {
                                              return Shimmer.fromColors(
                                                baseColor: Colors.grey.shade300,
                                                highlightColor:
                                                    Colors.grey.shade100,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                    left: appW(20),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: appH(
                                                                10,
                                                              ),
                                                              horizontal: appW(
                                                                16,
                                                              ),
                                                            ),
                                                        width: appW(207),
                                                        height: appH(134),
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                12,
                                                              ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: appH(12),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: appH(
                                                                10,
                                                              ),
                                                              horizontal: appW(
                                                                16,
                                                              ),
                                                            ),
                                                        width: appW(90),
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                12,
                                                              ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: appH(10),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: appH(
                                                                10,
                                                              ),
                                                              horizontal: appW(
                                                                16,
                                                              ),
                                                            ),
                                                        width: appW(70),
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                12,
                                                              ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: appH(15),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: appH(
                                                                10,
                                                              ),
                                                              horizontal: appW(
                                                                16,
                                                              ),
                                                            ),
                                                        width: appW(200),
                                                        height: appH(40),
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                12,
                                                              ),
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

                                      return _buildHorizontalCourseList(
                                        allCourses,
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    } else if (selectedIndex == 1) {
                      return BlocBuilder<ForeignBloc, ForeignState>(
                        builder: (context, state) {
                          if (state is ForeignLoaded) {
                            return _buildHorizontalCourseList(
                              state.response.data,
                            );
                          }
                          return CircularProgressIndicator();
                        },
                      );
                    } else if (selectedIndex == 2) {
                      return BlocBuilder<PreTripBloc, PreTripState>(
                        builder: (context, state) {
                          if (state is PreTripLoaded) {
                            return _buildHorizontalCourseList(
                              state.response.data,
                            );
                          }
                          return CircularProgressIndicator();
                        },
                      );
                    } else if (selectedIndex == 3) {
                      return BlocBuilder<SoftSkillsBloc, SoftSkillsState>(
                        builder: (context, state) {
                          if (state is SoftSkillsLoaded) {
                            return _buildHorizontalCourseList(
                              state.softSkills.data,
                            );
                          }
                          return CircularProgressIndicator();
                        },
                      );
                    } else if (selectedIndex == 4) {
                      return BlocBuilder<SkillTestBloc, SkillTestState>(
                        builder: (context, state) {
                          if (state is SkillTestLoaded) {
                            return _buildHorizontalCourseList([state.response]);
                          }
                          return CircularProgressIndicator();
                        },
                      );
                    }

                    return SizedBox.shrink();
                  },
                ),

                SizedBox(height: appH(10)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalCourseList(List<dynamic> courses) {
    return SizedBox(
      height: appH(295),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return CourseCard(
            image: course.imageUrl,
            text: course.title,
            onTap: () {
              AppRoute.go(SingleCoursePage(courseId: course.id));
            },
            richTextRate: '⭐ ${course.stars}',
            richTextHours: '  🕑 40 Soat',
          );
        },
      ),
    );
  }
}
