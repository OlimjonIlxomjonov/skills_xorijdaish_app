import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:readmore/readmore.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/button/basic_button_wg.dart';
import 'package:skills_xorijdaish/core/common/widgets/flush_bar/flush_bar_wg.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_vectors.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_courses_by_id/course_by_id_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_courses_by_id/course_by_id_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lessons/lesson_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lessons/lessons_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/start_course/start_course_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/single_lesson_video.dart';

class SingleCoursePage extends StatefulWidget {
  final int courseId;

  const SingleCoursePage({super.key, required this.courseId});

  @override
  State<SingleCoursePage> createState() => _SingleCoursePageState();
}

class _SingleCoursePageState extends State<SingleCoursePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<LessonsBloc>().add(LessonsEvent(widget.courseId));
    context.read<CourseByIdBloc>().add(CourseByIdEvent(widget.courseId));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int pageIndex = 0;

  final Set<int> doneLessonIds = {};

  String sanitizeHtml(String html) {
    return html
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&lsquo;', "'")
        .replaceAll('&rsquo;', "'")
        .replaceAll('&ldquo;', '"')
        .replaceAll('&rdquo;', '"')
        .replaceAll('&amp;', '&')
        .replaceAll('&quot;', '"')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll(RegExp(r'<[^>]*>'), '')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.white, body: buildBody());
  }

  Widget buildBody() {
    return BlocConsumer<CourseByIdBloc, CourseByIdState>(
      builder: (context, state) {
        if (state is CourseByIdLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CourseByIdLoaded) {
          final course = state.entity;
          return Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: appH(24), left: appW(10)),
                width: double.infinity,
                height: appH(300),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(course.imageUrl),
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
                        course.title,
                        style: AppTextStyles.source.medium(
                          color: AppColors.black,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: appH(12)),
                      Row(
                        spacing: appW(18),
                        children: [
                          buildText(AppVectors.star, course.stars.toString()),
                          buildText(AppVectors.clock, '20 Soat'),
                          buildText(
                            AppVectors.video,
                            '${course.videos} ta video',
                          ),
                          buildText(AppVectors.global, course.country.language),
                        ],
                      ),
                      SizedBox(height: appH(16)),
                      (state.entity.priceInfo != null &&
                              state.entity.priceInfo is Map &&
                              state.entity.priceInfo.containsKey('price'))
                          ? Row(
                            spacing: appW(12),
                            children: [
                              Text(
                                "${state.entity.priceInfo['price']} UZS",
                                style: AppTextStyles.source.bold(
                                  color: AppColors.secondBlue,
                                  fontSize: 28,
                                ),
                              ),
                              state.entity.priceInfo['discount'] != 0
                                  ? Text(
                                    "${state.entity.priceInfo['discount']} UZS",
                                    style: AppTextStyles.source.semiBold(
                                      color: AppColors.textGrey,
                                      fontSize: 18,
                                    ),
                                  )
                                  : SizedBox.shrink(),
                            ],
                          )
                          : const SizedBox.shrink(),

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
                        tabs: const [
                          Tab(text: "Ma'lumot"),
                          Tab(text: 'Darslar'),
                        ],
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
        return SizedBox.shrink();
      },
      listener: (context, state) {
        if (state is CourseByIdError) {
          showErrorFlushbar(context, 'Xato');
        }
      },
    );
  }

  Widget _informationTab() {
    return BlocConsumer<CourseByIdBloc, CourseByIdState>(
      listener: (context, state) {
        if (state is CourseByIdError) {
          Flushbar(
            message: "Xatolik yuz berdi",
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
            flushbarPosition: FlushbarPosition.TOP,
            icon: Icon(Icons.close, color: Colors.white),
            margin: EdgeInsets.all(8),
            borderRadius: BorderRadius.circular(8),
          ).show(context);
        }
      },
      builder: (context, state) {
        if (state is CourseByIdLoading) {
          return CircularProgressIndicator();
        } else if (state is CourseByIdLoaded) {
          final course = state.entity;
          return Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: appH(10)),
                  child: Column(
                    spacing: appH(18),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReadMoreText(
                        sanitizeHtml(course.description),
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
                      customListTile(
                        "Talab bo'yicha 2,5 soatlik video",
                        AppVectors.slowMotion,
                      ),
                      customListTile(
                        "Mobil, ish stoli va televizorda kirish",
                        AppVectors.technology,
                      ),
                      customListTile(
                        "Qo'llab-quvvatlanadigan fayllar",
                        AppVectors.audioBook,
                      ),
                      customListTile(
                        "To'liq umr bo'yi kirish",
                        AppVectors.infinite,
                      ),
                      customListTile(
                        "Tugatish sertifikati",
                        AppVectors.interface,
                      ),
                      Visibility(
                        visible: !course.isStarted,
                        child: BasicButtonWg(
                          text:
                              (state.entity.priceInfo != null &&
                                      state.entity.priceInfo is Map &&
                                      state.entity.priceInfo.containsKey(
                                        'price',
                                      ))
                                  ? "Sotib olish - ${state.entity.priceInfo['price']}"
                                  : 'Boshlash',
                          onTap: () {
                            context.read<StartCourseBloc>().add(
                              StartCourseEvent(widget.courseId),
                            );
                            // context.read<CourseByIdBloc>().add(
                            //   CourseByIdEvent(widget.courseId),
                            // );
                            // context.read<LessonsBloc>().add(
                            //   LessonsEvent(widget.courseId),
                            // );
                            state.entity.priceInfo != null &&
                                    state.entity.priceInfo is Map &&
                                    state.entity.priceInfo.containsKey('price')
                                ? showBottomSheet(
                                  context: context,
                                  builder:
                                      (context) => Container(
                                        padding: EdgeInsets.only(top: 10),
                                        height: appH(280),
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 180,
                                                  ),
                                              child: Divider(
                                                height: 5,
                                                thickness: 3,
                                              ),
                                            ),
                                            SizedBox(height: appH(10)),
                                            Text(
                                              "To'lov",
                                              style: AppTextStyles.source
                                                  .medium(
                                                    color: AppColors.black,
                                                    fontSize: 20,
                                                  ),
                                            ),
                                            SizedBox(height: appH(10)),
                                            Divider(),
                                            SizedBox(height: appH(10)),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: appH(20),
                                              ),
                                              child: Column(
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      // if (state.entity.isPaid ==
                                                      //     true) {
                                                      //   successFlushBar(
                                                      //     context,
                                                      //     'Successfully started!',
                                                      //   );
                                                      //   _tabController
                                                      //       .animateTo(1);
                                                      // } else {
                                                      //   showErrorFlushbar(
                                                      //     context,
                                                      //     'Not Paid!',
                                                      //   );
                                                      // }
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            vertical: 10,
                                                          ),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10,
                                                            ),
                                                      ),
                                                      shadowColor:
                                                          Colors.transparent,
                                                      minimumSize: Size(
                                                        double.infinity,
                                                        appH(50),
                                                      ),
                                                      backgroundColor: Color(
                                                        0xffF7F7F8,
                                                      ),
                                                    ),
                                                    child: Image.asset(
                                                      AppImages.paymentClick,
                                                      width: appW(64),
                                                      height: appH(24),
                                                    ),
                                                  ),
                                                  SizedBox(height: appH(50)),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      AppRoute.close();
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      shadowColor:
                                                          Colors.transparent,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10,
                                                            ),
                                                        side: BorderSide(
                                                          width: 1,
                                                          color:
                                                              AppColors.appBg,
                                                        ),
                                                      ),
                                                      backgroundColor:
                                                          AppColors.white,
                                                      minimumSize: Size(
                                                        double.infinity,
                                                        appH(50),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Bekor qilish',
                                                      style: AppTextStyles
                                                          .source
                                                          .regular(
                                                            color:
                                                                AppColors.appBg,
                                                            fontSize: 14,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                )
                                : _lessonsTab();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }

  Widget customListTile(String tileTitle, String icons) {
    return Row(
      spacing: appW(12),
      children: [
        SvgPicture.asset(icons),
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
    return BlocBuilder<LessonsBloc, LessonsState>(
      builder: (context, state) {
        if (state is LessonsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is LessonsLoaded) {
          final itemCount = state.response.data.length;
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              final lesson = state.response.data[index];
              final isLast = index == itemCount - 1;
              final bool isDone = lesson.isAccessible;
              final Color mainColor =
                  isDone ? AppColors.mainGreen : Color(0xffDAE1E9);
              final Color textColor =
                  isDone ? AppColors.black : Color(0xffDAE1E9);
              return Column(
                // spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    onTap:
                        lesson.isAccessible
                            ? () {
                              AppRoute.go(
                                SingleLessonVideo(
                                  courseId: widget.courseId,
                                  lessonId: lesson.id,
                                  title: lesson.title,
                                ),
                              );
                            }
                            : null,
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: mainColor, width: 3),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          lesson.imageUrl,
                          height: 50,
                          width: 45,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return SizedBox(
                              height: 50,
                              width: 45,
                              child: Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  value:
                                      loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress
                                                  .cumulativeBytesLoaded /
                                              (loadingProgress
                                                      .expectedTotalBytes ??
                                                  1)
                                          : null,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 50,
                              width: 45,
                              color: Colors.grey[300],
                              child: Icon(Icons.error, size: 20),
                            );
                          },
                        ),
                      ),
                    ),
                    title: Text(
                      lesson.title,
                      style: AppTextStyles.source.medium(
                        color: textColor,
                        fontSize: 16,
                      ),
                    ),
                    subtitle:
                        isDone
                            ? RatingBar.builder(
                              initialRating: double.tryParse(lesson.stars) ?? 0,
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(
                                horizontal: 4.0,
                              ),
                              itemSize: appH(12),
                              ignoreGestures: true,
                              itemBuilder:
                                  (context, _) => Icon(
                                    IconlyLight.star,
                                    color: Colors.amber,
                                  ),
                              onRatingUpdate: (rating) {},
                            )
                            : null,
                  ),
                  if (!isLast)
                    Container(
                      margin: EdgeInsets.only(left: appW(27), bottom: 5),
                      width: appW(3),
                      height: appH(18),
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                ],
              );
            },
          );
        } else if (state is LessonsError) {
          return Center(child: Text(state.message));
        }
        return SizedBox.shrink();
      },
    );
  }

  Widget buildText(String icons, String myText) {
    return Row(
      spacing: 5,
      children: [
        SvgPicture.asset(icons),
        Text(
          myText,
          style: AppTextStyles.source.medium(
            color: AppColors.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
