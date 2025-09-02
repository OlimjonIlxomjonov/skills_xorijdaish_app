import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/common/widgets/button/basic_button_wg.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/finish_test/finish_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/finish_test/finish_test_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lessons/lesson_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../../core/common/textstyles/app_text_styles.dart';
import '../../../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../widgets/past_test_state_wg.dart';

class FinishTestPage extends StatelessWidget {
  final int courseId, lessonId;

  const FinishTestPage({
    super.key,
    required this.courseId,
    required this.lessonId,
  });

  @override
  Widget build(BuildContext context) {
    context.read<FinishTestBloc>().add(FinishTestEvent(courseId, lessonId));
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(titleText: 'Natija'),
      body: BlocBuilder<FinishTestBloc, FinishTestState>(
        builder: (context, state) {
          if (state is FinishTestLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FinishTestError) {
            return Text('error');
          } else if (state is FinishTestLoaded) {
            final finish = state.entity;
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: appW(20),
                vertical: appH(20),
              ),
              child: Column(
                children: [
                  CircularStepProgressIndicator(
                    totalSteps: finish.all,
                    currentStep: finish.incorrects,
                    stepSize: 15,
                    selectedColor: Color(0xffE24C4B),
                    unselectedColor: Color(0xff24CF81),
                    padding: 0,
                    width: appW(144),
                    height: appH(144),
                    selectedStepSize: 15,
                    roundedCap: (_, __) => true,
                    child: Center(
                      child: Text(
                        "${finish.percent.round()}%",
                        style: AppTextStyles.source.bold(
                          color: AppColors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: appH(32)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Container(
                        width: appW(10),
                        height: appH(10),
                        decoration: BoxDecoration(
                          color: Color(0xff24CF81),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text("To’g’ri"),
                      SizedBox(width: appW(12)),
                      Container(
                        width: appW(10),
                        height: appH(10),
                        decoration: BoxDecoration(
                          color: Color(0xffE24C4B),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text("Noto’g’ri"),
                    ],
                  ),
                  SizedBox(height: appH(24)),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: appW(25),
                      vertical: appH(24),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffF7F7F8),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      spacing: 21,
                      children: [
                        testResult(finish.all.toString(), 'Jami savollar'),
                        testResult(finish.corrects.toString(), "To'g'ri"),
                        testResult(finish.incorrects.toString(), "Noto'g'ri"),
                      ],
                    ),
                  ),
                  Spacer(),
                  BasicButtonWg(
                    text: 'Asosiyga qaytish',
                    onTap: () {
                      AppRoute.close();
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        barrierColor: Colors.black.withOpacity(0.5),
                        builder: (context) => ResultDialog(finish: finish),
                      );
                      context.read<LessonsBloc>().add(LessonsEvent(courseId, 1));
                    },
                  ),
                ],
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  Row testResult(finish, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTextStyles.source.medium(
            color: AppColors.textGrey,
            fontSize: 16,
          ),
        ),
        Text(
          finish,
          style: AppTextStyles.source.medium(
            color: AppColors.black,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
