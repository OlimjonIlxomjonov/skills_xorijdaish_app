import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/common/widgets/lessons/lessons_list_wg.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/soft_skills/soft_skills_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/soft_skills/soft_skills_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';

import '../../../../../../core/common/constants/colors/app_colors.dart';

class SoftSkillsPage extends StatefulWidget {
  final String query;

  const SoftSkillsPage({super.key, required this.query});

  @override
  State<SoftSkillsPage> createState() => _SoftSkillsPageState();
}

class _SoftSkillsPageState extends State<SoftSkillsPage> {
  @override
  void initState() {
    context.read<SoftSkillsBloc>().add(GetSoftSkillsEvent(widget.query));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(titleText: 'Soft Skills'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(20)),
        child: BlocBuilder<SoftSkillsBloc, SoftSkillsState>(
          builder: (context, state) {
            if (state is SoftSkillsLoading) {
              return ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: appH(10),
                          horizontal: appW(16),
                        ),
                        height: appH(300),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is SoftSkillsLoaded) {
              return ListView.builder(
                itemCount: state.softSkills.data.length,
                itemBuilder: (context, index) {
                  final softSkill = state.softSkills.data[index];
                  return LessonsListWg(
                    image: softSkill.imageUrl,
                    title: softSkill.title,
                    fileCount: softSkill.filesCount,
                    stars: softSkill.stars,
                    videoCount: softSkill.lessonsCount,
                    courseId: softSkill.id,
                    isStarted: softSkill.isStarted,
                  );
                },
              );
            } else if (state is SoftSkillsError) {
              return Text(state.message);
            }
            return Text('Loading');
          },
        ),
      ),
    );
  }
}
