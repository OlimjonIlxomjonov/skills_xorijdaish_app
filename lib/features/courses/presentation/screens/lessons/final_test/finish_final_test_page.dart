import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/common/widgets/button/basic_button_wg.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/finish_final_test/finish_final_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/finish_final_test/finish_final_test_state.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/common/textstyles/app_text_styles.dart';
import '../../../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../widgets/finish_result_dialog_wg.dart';

class FinishFinalTestPage extends StatelessWidget {
  final int courseId;

  const FinishFinalTestPage({super.key, required this.courseId});

  Future<void> openCertificateUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    context.read<FinishFinalTestBloc>().add(FinishFinalTestEvent(courseId));
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Natija',
            style: AppTextStyles.source.semiBold(
              color: AppColors.black,
              fontSize: 20,
            ),
          ),
        ),
        body: BlocBuilder<FinishFinalTestBloc, FinishFinalTestState>(
          builder: (context, state) {
            if (state is FinishFinalTestLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FinishFinalTestLoaded) {
              final finish = state.response.data;
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: appW(20),
                  vertical: appH(20),
                ),
                child: SingleChildScrollView(
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
                            testResult(
                              finish.incorrects.toString(),
                              "Noto'g'ri",
                            ),
                            testResult(formatDuration(finish.time), "Vaqt"),
                          ],
                        ),
                      ),
                      SizedBox(height: appH(40)),
                      ElevatedButton(
                        onPressed: () {
                          openCertificateUrl(finish.certificateUrl);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, appH(51)),
                          backgroundColor: AppColors.white,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: AppColors.appBg, width: 1),
                          ),
                        ),
                        child: Text(
                          "Sertificatni ko'rish",
                          style: AppTextStyles.source.medium(
                            color: AppColors.appBg,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: appH(10)),
                      BasicButtonWg(
                        text: 'Asosiyga qaytish',
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            barrierColor: Colors.black.withOpacity(0.5),
                            builder:
                                (context) =>
                                    FinishResultDialogWg(courseId: courseId),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
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
