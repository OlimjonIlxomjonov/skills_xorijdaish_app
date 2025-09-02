import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/common/widgets/flush_bar/flush_bar_wg.dart';
import 'package:skills_xorijdaish/core/common/widgets/flush_bar/sucess_flesh_bar_wg.dart';
import 'package:skills_xorijdaish/core/common/widgets/flush_bar/warning_bar_wg.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_file/file_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_file/file_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_video/video_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_video/video_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_by_id/lesson_by_id_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_by_id/lesson_by_id_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/lesson_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/lesson_test_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lessons/lesson_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lessons/lessons_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/set_video_time/set_video_time_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/content_page.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/tests/tests_page.dart';
import 'package:skills_xorijdaish/features/courses/presentation/widgets/player_video_widget.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../../core/configs/file_view_page.dart';
import '../../../../../main.dart';
import '../../widgets/face_id_verif_wg.dart';

class SingleLessonVideo extends StatefulWidget {
  final int courseId;
  final int lessonId;
  final String title;
  final String imageUrl;
  final bool isTestEnabled;
  final bool isCameraVerifEnabled;

  const SingleLessonVideo({
    super.key,
    required this.courseId,
    required this.lessonId,
    required this.title,
    required this.imageUrl,
    required this.isTestEnabled,
    required this.isCameraVerifEnabled,
  });

  @override
  State<SingleLessonVideo> createState() => _SingleLessonVideoState();
}

class _SingleLessonVideoState extends State<SingleLessonVideo> {
  bool _isWatched = true;

  @override
  void initState() {
    context.read<FileBloc>().add(FileEvent(widget.courseId, widget.lessonId));
    context.read<VideoBloc>().add(VideoEvent(widget.courseId, widget.lessonId));
    context.read<LessonTestBloc>().add(
      LessonTestEvent(widget.courseId, widget.lessonId),
    );
    context.read<LessonByIdBloc>().add(
      LessonsByIdEvent(widget.courseId, widget.lessonId),
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    context.read<VideoBloc>().close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        titleText: AppStrings.lessons,
        onTap: () {
          AppRoute.close();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: AppTextStyles.source.medium(
                color: AppColors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(height: appH(20)),
            BlocBuilder<VideoBloc, VideoState>(
              builder: (context, state) {
                if (state is VideoLoading) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: appH(10),
                        horizontal: appW(16),
                      ),
                      height: appH(200),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                } else if (state is VideoLoaded) {
                  return M3u8VideoPlayer(
                    videoUrl: state.entity.url,
                    onVideoEnd: () {
                      setState(() {
                        _isWatched = true;
                      });
                    },
                    imageUrl: widget.imageUrl,
                  );
                }
                return SizedBox.shrink();
              },
            ),
            SizedBox(height: appH(20)),
            GestureDetector(
              onTap: () {
                AppRoute.go(ContentPage());
              },
              child: buildContainer(
                "Qo’shimcha ma’lumotlar",
                Text(
                  'Kurs bo’yicha ba’tafsil ma’lumotlar',
                  style: AppTextStyles.source.regular(
                    color: AppColors.textGrey,
                    fontSize: 14,
                  ),
                ),
                AppImages.bookLamp,
              ),
            ),
            BlocBuilder<FileBloc, FileState>(
              builder: (context, state) {
                if (state is FileLoading) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: appH(10),
                        horizontal: appW(16),
                      ),
                      height: appH(80),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                } else if (state is FileLoaded) {
                  return DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(20),
                    dashPattern: [6, 4],
                    color: Color(0xff9D97B5),
                    strokeWidth: 1.5,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffF7F7F8),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade50,
                            spreadRadius: 1,
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: ListTile(
                        onTap: () {
                          final fileUrl = state.entity.path;
                          final extension = state.entity.fileExtension;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => FileViewerPage(
                                    extension: extension,
                                    url: fileUrl,
                                  ),
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffF7F7F8),
                          ),
                          child: Image.asset(AppImages.abc),
                        ),
                        title: Text(
                          widget.title,
                          style: AppTextStyles.source.regular(
                            color: AppColors.black,
                            fontSize: 14,
                          ),
                        ),
                        subtitle: Text(
                          "${(state.entity.fileSize / 1000).round()} Kb",
                          style: AppTextStyles.source.regular(
                            color: AppColors.textGrey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (state is FileError) {
                  return Container(
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
                  );
                }
                return SizedBox.shrink();
              },
            ),
            SizedBox(height: appH(20)),
            BlocBuilder<LessonTestBloc, LessonTestState>(
              builder: (context, state) {
                if (state is LessonTestLoading) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: appH(10),
                        horizontal: appW(16),
                      ),
                      height: appH(80),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                } else if (state is LessonTestLoaded) {
                  final testId = state.response.data.map((e) => e.id).toList();
                  final testType =
                      state.response.data.map((e) => e.type).toList();
                  logger.f(testId);
                  if (state.response.data.isEmpty) {
                    return SizedBox.shrink();
                  }
                  return GestureDetector(
                    onTap: () async {
                      if (!_isWatched) {
                        showErrorFlushbar(
                          context,
                          'Videoni oxirhacha tomosha qiling',
                        );
                        return;
                      }
                      if (widget.isCameraVerifEnabled) {
                        final success = await startFaceVerification(context);
                        logger.f('Raw MyID result: $success');

                        if (success) {
                          AppRoute.go(
                            TestsPage(
                              courseId: widget.courseId,
                              lessonId: widget.lessonId,
                              questionId: testId,
                              testType: testType,
                            ),
                          );
                        }
                        return;
                      }

                      widget.isTestEnabled
                          ? warningBarWg(context, "Test o'tib bo'lingan!")
                          : AppRoute.go(
                            TestsPage(
                              courseId: widget.courseId,
                              lessonId: widget.lessonId,
                              questionId: testId,
                              testType: testType,
                            ),
                          );
                    },
                    child: buildContainer(
                      "Test topshiriqlari",
                      BlocBuilder<VideoBloc, VideoState>(
                        builder: (context, state) {
                          if (state is VideoLoaded) {
                            return Column(
                              spacing: 5,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Bajarilgan',
                                      style: AppTextStyles.source.regular(
                                        color: AppColors.textGrey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "${state.entity.percentage}%",
                                      style: AppTextStyles.source.regular(
                                        color: AppColors.textGrey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                LinearPercentIndicator(
                                  padding: EdgeInsets.zero,
                                  animation: false,
                                  lineHeight: appH(8),
                                  percent:
                                      state.entity.percentage.toDouble() / 100,
                                  backgroundColor: Colors.grey.shade200,
                                  barRadius: Radius.circular(16),
                                  progressColor: AppColors.secondBlue,
                                ),
                              ],
                            );
                          }
                          return SizedBox.shrink();
                        },
                      ),
                      AppImages.tests,
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(String title, Widget subTitle, String image) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade50,
            spreadRadius: 1,
            blurRadius: 15,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xffF7F7F8),
          ),
          child: Image.asset(image),
        ),
        title: Text(
          title,
          style: AppTextStyles.source.medium(
            color: AppColors.black,
            fontSize: 16,
          ),
        ),
        subtitle: subTitle,
      ),
    );
  }

  Widget stripedProgressBar(double percent) {
    return Stack(
      children: [
        Container(
          height: appH(14),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: percent,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  tileMode: TileMode.repeated,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [AppColors.secondBlue, AppColors.white],
                  stops: [0.0, 0.5],
                ).createShader(bounds);
              },
              child: Container(height: appH(14), color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
