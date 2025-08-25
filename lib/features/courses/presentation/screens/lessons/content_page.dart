import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';

import '../../bloc/lesson_by_id/lesson_by_id_bloc.dart';
import '../../bloc/lesson_by_id/lesson_by_id_state.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(titleText: 'Darslar'),
      body: BlocBuilder<LessonByIdBloc, LessonsByIdState>(
        builder: (context, state) {
          if (state is LessonsByIdLoaded) {
            final content = state.entity;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: appW(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: appH(10)),
                  Text(
                    content.title,
                    style: AppTextStyles.source.medium(
                      color: AppColors.black,
                      fontSize: 18,
                    ),
                  ),
                  Html(
                    data: content.content,
                    style: {'p': Style(fontSize: FontSize(15))},
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
}
