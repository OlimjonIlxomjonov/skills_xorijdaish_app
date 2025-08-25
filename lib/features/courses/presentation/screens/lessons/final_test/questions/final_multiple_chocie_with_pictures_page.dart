import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/multiple_choice_with_pictures/fetch_final_multiple_choice_with_pictures_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/multiple_choice_with_pictures/fetch_final_multple_choice_with_pictures_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/multiple_choice_with_pictures/multiple_ch_with_pictures.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/multiple_choice_with_pictures/multiple_ch_with_pictures_state.dart';

class FinalMultipleChocieWithPicturesPage extends StatefulWidget {
  final int courseId;
  final int questionId;
  final ValueChanged<int> onOptionSelected;

  const FinalMultipleChocieWithPicturesPage({
    super.key,
    required this.courseId,
    required this.questionId,
    required this.onOptionSelected,
  });

  @override
  State<FinalMultipleChocieWithPicturesPage> createState() =>
      _FinalMultipleChocieWithPicturesPageState();
}

class _FinalMultipleChocieWithPicturesPageState
    extends State<FinalMultipleChocieWithPicturesPage> {
  int? selectedId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<
        FetchFinalMultipleChoiceWithPicturesBloc,
        FetchFinalMultipleChoiceWithPicturesState
      >(
        builder: (context, state) {
          if (state is FetchFinalMultipleChoiceWithPicturesLoaded) {
            final pic = state.entity;
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: appW(20),
                vertical: appW(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pic.task,
                    style: AppTextStyles.source.medium(
                      color: AppColors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: appH(10)),
                  Text(
                    pic.question,
                    style: AppTextStyles.source.medium(
                      color: AppColors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: appH(20)),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: appH(15),
                        crossAxisSpacing: appW(15),
                        childAspectRatio: 0.8,
                      ),
                      itemCount: state.entity.options.length,
                      itemBuilder: (context, index) {
                        final withPic = state.entity.options[index];
                        final isSelected = selectedId == withPic.id;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedId = withPic.id;
                              widget.onOptionSelected(withPic.id);
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: appH(10),
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xffF7F7F8),
                                  border: Border.all(
                                    color:
                                        isSelected
                                            ? AppColors.blue
                                            : Color(0xffE0E0E0),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    Image.network(withPic.imageUrl),
                                    Spacer(),
                                    Text(
                                      withPic.title,
                                      style: AppTextStyles.source.medium(
                                        color: AppColors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (isSelected)
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Icon(
                                    Icons.check,
                                    color: AppColors.blue,
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (state is FetchFinalMultipleChoiceWithPicturesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
