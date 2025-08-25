import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_vectors.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/foreign_language/foreign_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/foreign_language/foreign_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';

import '../../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../../core/common/widgets/lessons/lessons_list_wg.dart';
import '../../../../../../core/utils/responsiveness/app_responsive.dart';

class ForeignLanguagesPage extends StatefulWidget {
  final String cardTitle;

  const ForeignLanguagesPage({super.key, required this.cardTitle});

  @override
  State<ForeignLanguagesPage> createState() => _ForeignLanguagesPageState();
}

class _ForeignLanguagesPageState extends State<ForeignLanguagesPage> {
  @override
  void initState() {
    context.read<ForeignBloc>().add(GetForeignLanguageEvent(widget.cardTitle));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(titleText: 'Xorij tillari'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(20)),
        child: BlocBuilder<ForeignBloc, ForeignState>(
          builder: (context, state) {
            if (state is ForeignLoading) {
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
            } else if (state is ForeignLoaded) {
              final isEmpty = state.response.data.isEmpty;
              if (isEmpty) {
                return Center(
                  child: Text(
                    'Hech qanday kurs topilmadi!',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }
              return ListView.builder(
                itemCount: state.response.data.length,
                itemBuilder: (context, index) {
                  final foreign = state.response.data[index];

                  return LessonsListWg(
                    image: foreign.imageUrl,
                    title: foreign.title,
                    fileCount: foreign.filesCount,
                    stars: foreign.stars,
                    videoCount: foreign.lessonsCount,
                    language: foreign.country.language,
                    courseId: foreign.id,
                    isStarted: foreign.isStarted,
                    isDone: foreign.isDone,
                  );
                },
              );
            } else if (state is ForeignError) {
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
