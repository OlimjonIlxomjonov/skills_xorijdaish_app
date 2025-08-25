import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:skills_xorijdaish/core/common/widgets/button/basic_button_wg.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/finish_test/finish_test_entity.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../core/common/constants/colors/app_colors.dart';
import '../../../../core/common/textstyles/app_text_styles.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';

class ResultDialog extends StatefulWidget {
  final FinishTestEntity finish;

  const ResultDialog({super.key, required this.finish});

  @override
  State<ResultDialog> createState() => _ResultDialogState();
}

class _ResultDialogState extends State<ResultDialog> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: Duration(seconds: 2));

    if (widget.finish.nextLessonId != null) {
      _confettiController.play();
    }
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
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
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(27),
                  width: appW(184),
                  height: appH(184),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff00D2FF).withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                    shape: BoxShape.circle,
                    color: Color(0xff00D2FF),
                  ),
                  child: CircularStepProgressIndicator(
                    totalSteps: widget.finish.all,
                    currentStep: widget.finish.incorrects,
                    stepSize: 10,
                    selectedColor: Color(0xffDAE1E9),
                    unselectedColor: AppColors.white,
                    padding: 0,
                    width: appW(144),
                    height: appH(144),
                    selectedStepSize: 10,
                    roundedCap: (_, __) => true,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${widget.finish.percent.round()}%",
                            style: AppTextStyles.source.semiBold(
                              color: AppColors.white,
                              fontSize: 34,
                            ),
                          ),
                          Text(
                            "${widget.finish.corrects} of ${widget.finish.all}",
                            style: AppTextStyles.source.regular(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                RatingBar.builder(
                  initialRating: widget.finish.stars.toDouble(),
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemSize: appH(32),
                  ignoreGestures: true,
                  itemBuilder:
                      (context, _) =>
                          Icon(IconlyBold.star, color: AppColors.secondBlue),
                  onRatingUpdate: (rating) {},
                ),
                SizedBox(height: 32),
                Text(
                  widget.finish.nextLessonId != null
                      ? "Tabriklaymiz!"
                      : 'Test topshirilmadi!',
                  style: AppTextStyles.source.medium(
                    color: AppColors.black,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  widget.finish.nextLessonId != null
                      ? "Keyingi safar ko'proq o'rganing va barcha to'g'ri javoblarni oling."
                      : "Afsuski testdan o’tolmadingiz! Iltimos yana qaytadan urinib ko’ring",
                  style: AppTextStyles.source.regular(
                    color: AppColors.textGrey,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                BasicButtonWg(
                  text: 'Tasdiqlash',
                  onTap: () {
                    AppRoute.close();
                  },
                ),
              ],
            ),
          ),
        ),
        if (widget.finish.nextLessonId != null)
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            numberOfParticles: 30,
            emissionFrequency: 0.03,
            gravity: 0.3,
            colors: [
              Colors.blue,
              Colors.pink,
              Colors.orange,
              Colors.purple,
              Colors.green,
            ],
          ),
      ],
    );
  }
}
