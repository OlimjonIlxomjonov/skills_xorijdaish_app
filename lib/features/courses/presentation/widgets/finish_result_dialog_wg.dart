import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:skills_xorijdaish/core/common/widgets/button/basic_button_wg.dart';
import 'package:skills_xorijdaish/core/common/widgets/flush_bar/flush_bar_wg.dart';
import 'package:skills_xorijdaish/core/common/widgets/flush_bar/sucess_flesh_bar_wg.dart';
import 'package:skills_xorijdaish/core/common/widgets/flush_bar/warning_bar_wg.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/features/app_bottom_nav.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/finish_test/finish_test_entity.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/rate_course/rate_course_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/single_course/single_course_page.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/common/constants/colors/app_colors.dart';
import '../../../../core/common/textstyles/app_text_styles.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';

class FinishResultDialogWg extends StatefulWidget {
  final int courseId;

  const FinishResultDialogWg({super.key, required this.courseId});

  @override
  State<FinishResultDialogWg> createState() => _FinishResultDialogWgState();
}

class _FinishResultDialogWgState extends State<FinishResultDialogWg> {
  double starRate = 0;
  final TextEditingController textController = TextEditingController();

  void sendRate() {
    final comment = textController.text.trim();

    if (starRate <= 0 || comment.isEmpty) {
      showErrorFlushbar(context, "Maydon bo'sh bolishi mumkin emas!");
    } else {
      context.read<RateCourseBloc>().add(
        RateCourseEvent(widget.courseId, starRate, comment),
      );
      AppRoute.open(AppBottomNav());
      successFlushBar(context, 'Kurs muvaffaqiyatli tugatildi!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: appW(20)),
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: appW(20),
              vertical: appH(30),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Tabriklaymiz!',
                  style: AppTextStyles.source.medium(
                    color: AppColors.black,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: appH(16)),
                Text(
                  "O’zingizni fikringizni qoldiring!",
                  style: AppTextStyles.source.regular(
                    color: AppColors.black,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: appH(32)),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemSize: appH(32),
                  ignoreGestures: false,
                  itemBuilder:
                      (context, _) =>
                          Icon(IconlyBold.star, color: Color(0xffFFBF43)),
                  onRatingUpdate: (rating) {
                    setState(() {
                      starRate = rating;
                    });
                    logger.f(starRate);
                  },
                ),
                SizedBox(height: appH(32)),
                Container(
                  padding: EdgeInsets.only(
                    top: appH(10),
                    bottom: appH(10),
                    left: appW(20),
                    right: appW(10),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffF7F7F8),
                    border: Border.all(color: Color(0xffE0E0E0)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'Izoh qoldiring...',
                      hintStyle: TextStyle(
                        color: AppColors.black.withOpacity(0.25),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: appH(32)),
                BasicButtonWg(text: 'Tasdiqlash', onTap: sendRate),
                SizedBox(height: appH(12)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    minimumSize: Size(double.infinity, appH(51)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: AppColors.appBg),
                    ),
                    backgroundColor: AppColors.white,
                  ),
                  onPressed: () {
                    AppRoute.close();
                  },
                  child: Text(
                    'Bekor qilish',
                    style: AppTextStyles.source.medium(
                      color: AppColors.appBg,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
