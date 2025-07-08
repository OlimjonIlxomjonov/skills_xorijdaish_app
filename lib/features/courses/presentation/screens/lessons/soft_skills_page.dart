import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/common/widgets/lessons/lessons_list_wg.dart';
import 'package:skills_xorijdaish/core/page_route/bottom_nav_wrapper.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/soft_skills/soft_skills_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/soft_skills/soft_skills_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';

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
    return BottomNavWrapper(
      initialIndex: 2,
      appBar: CustomAppBar(titleText: 'Soft Skills'),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(20)),
        child: BlocBuilder<SoftSkillsBloc, SoftSkillsState>(
          builder: (context, state) {
            if (state is SoftSkillsLoading) {
              return CircularProgressIndicator();
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
