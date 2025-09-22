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
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/buy_course/buy_course_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/finish_final_test/finish_final_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/finish_final_test/finish_final_test_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_courses_by_id/course_by_id_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_courses_by_id/course_by_id_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/final_test_course/final_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/final_test_course/final_test_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lessons/lesson_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lessons/lessons_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/start_course/start_course_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/final_test/final_test_page.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/single_lesson_video.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/common/widgets/flush_bar/warning_bar_wg.dart';
import '../../../../profile/presentation/bloc/self_info/self_info_bloc.dart';
import '../../../../profile/presentation/bloc/self_info/self_info_state.dart';
import '../../bloc/all_courses/buy_course/buy_course_state.dart';
import '../../widgets/face_id_verif_wg.dart';

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
    context.read<LessonsBloc>().add(LessonsEvent(widget.courseId, 1));
    context.read<CourseByIdBloc>().add(CourseByIdEvent(widget.courseId));
    context.read<FinalTestBloc>().add(FinalTestCourseEvent(widget.courseId));
    context.read<FinishFinalTestBloc>().add(
      FinishFinalTestEvent(widget.courseId),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.greyScale.grey500.withValues(
                          alpha: 0.3,
                        ),
                      ),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: appW(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: appH(10)),
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
                              buildText(
                                AppVectors.star,
                                course.stars.toString(),
                              ),
                              buildText(
                                AppVectors.clock,
                                formatDuration(course.videosDurationInSeconds),
                              ),
                              buildText(
                                AppVectors.video,
                                '${course.videos} ta video',
                              ),
                              buildText(
                                AppVectors.global,
                                course.country.language,
                              ),
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
                                        "${state.entity.priceInfo['old_price']} UZS",
                                        style: TextStyle(
                                          color: AppColors.textGrey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      )
                                      : SizedBox.shrink(),
                                ],
                              )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
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
          return Center(child: CircularProgressIndicator());
        } else if (state is CourseByIdLoaded) {
          final course = state.entity;
          logger.f(state.entity.videosDuration);
          return Padding(
            padding: EdgeInsets.only(left: appW(20), right: appW(20)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: appH(18),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReadMoreText(
                    sanitizeHtml(course.description),
                    trimLines: 2,
                    colorClickableText: AppColors.textBlue,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Batafsil',
                    trimExpandedText: ' Yopish',
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
                  Padding(
                    padding: EdgeInsets.only(bottom: appH(40)),
                    child: Visibility(
                      visible: !course.isStarted,
                      child: BasicButtonWg(
                        text:
                            (state.entity.priceInfo != null &&
                                    state.entity.priceInfo is Map &&
                                    state.entity.priceInfo.containsKey('price'))
                                ? "Sotib olish - ${state.entity.priceInfo['price']}"
                                : 'Boshlash',
                        onTap: () {
                          final hasPrice =
                              state.entity.priceInfo != null &&
                              state.entity.priceInfo is Map &&
                              state.entity.priceInfo.containsKey('price');

                          if (hasPrice) {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return Container(
                                  padding: EdgeInsets.only(top: appH(10)),
                                  height: appH(280),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: appW(180),
                                        ),
                                        child: Divider(height: 5, thickness: 3),
                                      ),
                                      SizedBox(height: appH(10)),
                                      Text(
                                        "To'lov",
                                        style: AppTextStyles.source.medium(
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
                                        child: column(),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            context.read<StartCourseBloc>().add(
                              StartCourseEvent(widget.courseId),
                            );
                            context.read<CourseByIdBloc>().add(
                              CourseByIdEvent(widget.courseId),
                            );
                            context.read<LessonsBloc>().add(
                              LessonsEvent(widget.courseId, 1),
                            );
                            _tabController.animateTo(1);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }

  Column column() {
    return Column(
      spacing: 50,
      children: [
        BlocConsumer<BuyCourseBloc, BuyCourseState>(
          listener: (context, state) {
            if (state is BuyCourseLoaded) {
              final url = state.entity.url;
              if (url.isNotEmpty) {
                launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
              }
            }
          },
          builder: (context, state) {
            bool isLoading = state is BuyCourseLoading;

            return ElevatedButton(
              onPressed:
                  isLoading
                      ? null
                      : () {
                        context.read<BuyCourseBloc>().add(
                          BuyCourseEvent(widget.courseId),
                        );
                      },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.transparent,
                minimumSize: Size(double.infinity, appH(50)),
                backgroundColor: const Color(0xffF7F7F8),
              ),
              child:
                  isLoading
                      ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          strokeWidth: 2,
                        ),
                      )
                      : Image.asset(
                        AppImages.paymentClick,
                        width: appW(64),
                        height: appH(24),
                      ),
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            AppRoute.close();
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, appH(51)),
            backgroundColor: AppColors.white,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Color(0xff5B7BFE), width: 2),
            ),
          ),
          child: Text(
            'Bekor qilish',
            style: AppTextStyles.source.medium(
              color: Color(0xff5B7BFE),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget customListTile(String tileTitle) {
    return Row(
      spacing: appW(12),
      children: [
        Text('•'),
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
          final lessons = state.response.data;

          return RefreshIndicator(
            onRefresh: () async {
              context.read<LessonsBloc>().add(LessonsEvent(widget.courseId, 1));
            },
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: appH(20)),
              itemCount: itemCount + 1,
              itemBuilder: (context, index) {
                if (index < itemCount) {
                  final lesson = lessons[index];
                  final isLast = index == itemCount - 1;
                  final bool isDone = lesson.isAccessible;
                  final bool isDoneTest = lesson.isDone;
                  final Color mainColor =
                      isDone ? AppColors.mainGreen : Color(0xffDAE1E9);
                  final Color textColor =
                      isDone ? AppColors.black : Color(0xffDAE1E9);
                  final currentPage = state.response.metaData.currentPage;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: appH(5)),
                        decoration:
                            isDoneTest
                                ? BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      AppColors.inputGreyColor.withValues(
                                        alpha: 0.1,
                                      ),
                                      AppColors.mainGreen.withValues(
                                        alpha: 0.2,
                                      ),
                                      Colors.transparent,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    stops: [0.2, 1, 0.85, 2],
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                )
                                : BoxDecoration(),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                          ),
                          child: ListTile(
                            tileColor: Colors.transparent,
                            onTap:
                                lesson.isAccessible
                                    ? () {
                                      AppRoute.go(
                                        SingleLessonVideo(
                                          courseId: widget.courseId,
                                          lessonId: lesson.id,
                                          title: lesson.title,
                                          imageUrl: lesson.imageUrl,
                                          isTestEnabled: lesson.isDone,
                                          isCameraVerifEnabled:
                                              lesson
                                                  .isCameraVerificationEnabled,
                                        ),
                                      );
                                    }
                                    : null,
                            contentPadding: EdgeInsets.zero,
                            leading: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: mainColor,
                                      width: 3,
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: Image.network(
                                      lesson.imageUrl,
                                      height: 50,
                                      width: 45,
                                      fit: BoxFit.cover,
                                      loadingBuilder: (
                                        context,
                                        child,
                                        loadingProgress,
                                      ) {
                                        if (loadingProgress == null)
                                          return child;
                                        return SizedBox(
                                          height: 50,
                                          width: 45,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              strokeWidth: 3,
                                              value:
                                                  loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
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
                                      errorBuilder: (
                                        context,
                                        error,
                                        stackTrace,
                                      ) {
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
                                if (isDoneTest)
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.mainGreen,
                                        shape: BoxShape.circle,
                                      ),
                                      padding: EdgeInsets.all(3),
                                      child: Icon(
                                        Icons.check,
                                        size: appH(12),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            title: Text(
                              lesson.title,
                              style: AppTextStyles.source.medium(
                                color: textColor,
                                fontSize: 16,
                              ),
                            ),
                            subtitle:
                                isDoneTest
                                    ? RatingBar.builder(
                                      initialRating:
                                          double.tryParse(lesson.stars) ?? 0,
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
                                            IconlyBold.star,
                                            color: Colors.amber,
                                          ),
                                      onRatingUpdate: (rating) {},
                                    )
                                    : null,
                          ),
                        ),
                      ),
                      if (!isLast)
                        Container(
                          margin: EdgeInsets.only(left: appW(25)),
                          width: appW(3),
                          height: appH(10),
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),

                      if (isLast)
                        state.response.metaData.total >
                                state.response.metaData.perPage
                            ? Row(
                              spacing: 30,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  style: IconButton.styleFrom(
                                    backgroundColor: AppColors.appBg,
                                    foregroundColor: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed:
                                      state.response.metaData.currentPage > 1
                                          ? () {
                                            context.read<LessonsBloc>().add(
                                              LessonsEvent(
                                                widget.courseId,
                                                currentPage - 1,
                                              ),
                                            );
                                          }
                                          : null,
                                  icon: Icon(Icons.keyboard_arrow_left),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: appW(10),
                                    vertical: appH(3),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 0.7,
                                      color: AppColors.appBg,
                                    ),
                                  ),
                                  child: Text(
                                    "${state.response.metaData.currentPage}",
                                  ),
                                ),

                                IconButton(
                                  style: IconButton.styleFrom(
                                    backgroundColor: AppColors.appBg,
                                    foregroundColor: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed:
                                      currentPage !=
                                              state.response.metaData.lastPage
                                          ? () {
                                            context.read<LessonsBloc>().add(
                                              LessonsEvent(
                                                widget.courseId,
                                                currentPage + 1,
                                              ),
                                            );
                                          }
                                          : null,
                                  icon: Icon(Icons.keyboard_arrow_right),
                                ),
                              ],
                            )
                            : SizedBox.shrink(),
                      if (isLast)
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
                    ],
                  );
                } else {
                  return BlocBuilder<FinalTestBloc, FinalTestState>(
                    builder: (context, finalState) {
                      if (finalState is FinalTestLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (finalState is FinalTestError) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xffDAE1E9),
                                width: 3,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                AppImages.finalTest,
                                height: 50,
                                width: 45,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            'Yakuniy test',
                            style: AppTextStyles.source.medium(
                              color: Color(0xffDAE1E9),
                              fontSize: 16,
                            ),
                          ),
                        );
                      } else if (finalState is FinalTestLoaded) {
                        final questionId =
                            finalState.response.data.map((e) => e.id).toList();
                        final testType =
                            finalState.response.data
                                .map((e) => e.type)
                                .toList();
                        final allAccessible = lessons.every(
                          (l) => l.isAccessible,
                        );
                        final Color mainColor =
                            allAccessible
                                ? AppColors.mainGreen
                                : Color(0xffDAE1E9);
                        final Color textColor =
                            allAccessible ? AppColors.black : Color(0xffDAE1E9);

                        final finishState =
                            context.read<FinishFinalTestBloc>().state;
                        final isOk =
                            (finishState is FinishFinalTestLoaded &&
                                finishState.response.ok);

                        return Column(
                          children: [
                            SizedBox(height: appH(5)),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: appH(5)),
                              decoration:
                                  isOk
                                      ? BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.transparent,
                                            AppColors.inputGreyColor.withValues(
                                              alpha: 0.1,
                                            ),
                                            AppColors.mainGreen.withValues(
                                              alpha: 0.2,
                                            ),
                                            Colors.transparent,
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          stops: [0.2, 1, 0.85, 2],
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      )
                                      : null,
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                ),
                                child: ListTile(
                                  onTap:
                                      allAccessible
                                          ? () async {
                                            if (finishState
                                                    is FinishFinalTestLoaded &&
                                                finishState.response.ok) {
                                              warningBarWg(
                                                context,
                                                'Yakuniy test allaqachon tugallangan!',
                                              );
                                              return;
                                            }

                                            final selfInfoState =
                                                context
                                                    .read<SelfInfoBloc>()
                                                    .state;
                                            bool isVerified = false;
                                            if (selfInfoState
                                                is SelfInfoLoaded) {
                                              isVerified =
                                                  selfInfoState
                                                      .entity
                                                      .isVerified;
                                            }

                                            if (isVerified) {
                                              AppRoute.go(
                                                FinalTestPage(
                                                  courseId: widget.courseId,
                                                  questionId: questionId,
                                                  testType: testType,
                                                ),
                                              );
                                              return;
                                            }

                                            final lessonsState =
                                                context
                                                    .read<LessonsBloc>()
                                                    .state;
                                            bool isCameraVerifEnabled = false;
                                            if (lessonsState is LessonsLoaded) {
                                              isCameraVerifEnabled =
                                                  lessonsState
                                                      .response
                                                      .data[index]
                                                      .isCameraVerificationEnabled;
                                            }

                                            if (isCameraVerifEnabled) {
                                              final success =
                                                  await startFaceVerification(
                                                    context,
                                                  );
                                              logger.f(
                                                'Raw MyID result: $success',
                                              );

                                              if (success) {
                                                AppRoute.go(
                                                  FinalTestPage(
                                                    courseId: widget.courseId,
                                                    questionId: questionId,
                                                    testType: testType,
                                                  ),
                                                );
                                              }
                                              return;
                                            }

                                            AppRoute.go(
                                              FinalTestPage(
                                                courseId: widget.courseId,
                                                questionId: questionId,
                                                testType: testType,
                                              ),
                                            );
                                          }
                                          : null,

                                  contentPadding: EdgeInsets.zero,
                                  leading: Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: mainColor,
                                            width: 3,
                                          ),
                                        ),
                                        child: ClipOval(
                                          child: Image.asset(
                                            AppImages.finalTest,
                                            height: 50,
                                            width: 45,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      BlocBuilder<
                                        FinishFinalTestBloc,
                                        FinishFinalTestState
                                      >(
                                        builder: (context, state) {
                                          if (state is FinishFinalTestLoaded) {
                                            final isFinished =
                                                state.response.ok;
                                            return isFinished
                                                ? Positioned(
                                                  right: 0,
                                                  bottom: 0,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColors.mainGreen,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    padding: EdgeInsets.all(3),
                                                    child: Icon(
                                                      Icons.check,
                                                      size: appH(12),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                )
                                                : SizedBox.shrink();
                                          }
                                          return SizedBox.shrink();
                                        },
                                      ),
                                    ],
                                  ),
                                  title: Text(
                                    'Yakuniy test',
                                    style: AppTextStyles.source.medium(
                                      color: textColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: appH(20)),
                          ],
                        );
                      }
                      return SizedBox.shrink();
                    },
                  );
                }
              },
            ),
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
