import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/common/widgets/lessons/lessons_list_wg.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/skill_test/skill_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/skill_test/skill_test_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';

import '../../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../../core/common/textstyles/app_text_styles.dart';
import '../../../../../../core/configs/assets/app_vectors.dart';

class SkillTestPage extends StatefulWidget {
  const SkillTestPage({super.key});

  @override
  State<SkillTestPage> createState() => _SkillTestPageState();
}

class _SkillTestPageState extends State<SkillTestPage> {
  @override
  void initState() {
    super.initState();
    context.read<SkillTestBloc>().add(SkillTestEvent('skill-test'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(titleText: 'Darslar'),
      body: Padding(
        padding: EdgeInsets.only(left: appW(20), right: appW(20)),
        child: BlocBuilder<SkillTestBloc, SkillTestState>(
          builder: (context, state) {
            if (state is SkillTestLoading) {
              return CircularProgressIndicator();
            } else if (state is SkillTestLoaded) {
              final skillTest = state.response;

              return LessonsListWg(
                title: skillTest.title,
                fileCount: skillTest.filesCount ?? 0,
                stars: skillTest.stars,
                image: skillTest.imageUrl,
                videoCount: skillTest.lessonsCount ?? 0,
                courseId: skillTest.id,
                isStarted: skillTest.isStarted,
                isDone: skillTest.isDone,
              );
            } else if (state is SkillTestError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppVectors.warning),
                    SizedBox(height: appH(20)),
                    Text(
                      'Ogohlantirish!',
                      style: AppTextStyles.source.medium(
                        color: AppColors.black,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: appH(20)),
                    Text(
                      'Ayni damda texnik ishlar olib borilyapti! \n Noqulayliklar uchun uzur sorab qolamiz!',
                      style: AppTextStyles.source.regular(
                        color: AppColors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
