import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/final_test_by_id/final_test_by_id_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/final_test_by_id/final_test_by_id_state.dart';
import '../../../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../../../core/common/textstyles/app_text_styles.dart';
import '../../../../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../widgets/test_card.dart';

class FinalMultipleChoice extends StatefulWidget {
  final int? selectedOptionId;
  final ValueChanged<int> onOptionSelected;

  const FinalMultipleChoice({
    super.key,
    required this.selectedOptionId,
    required this.onOptionSelected,
  });

  @override
  State<FinalMultipleChoice> createState() => _FinalMultipleChoiceState();
}

class _FinalMultipleChoiceState extends State<FinalMultipleChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<FinalTestByIdBloc, FinalTestByIdState>(
        builder: (context, state) {
          if (state is FinalTestByIdLoading) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: appW(20),
                vertical: appH(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          left: 40,
                          top: -20,
                          child: Shimmer.fromColors(
                            baseColor: AppColors.greyScale.grey300,
                            highlightColor: AppColors.white,
                            child: Container(
                              width: appW(265),
                              height: appH(60),
                              decoration: BoxDecoration(
                                color: AppColors.greyScale.grey300,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: -10,
                          child: Shimmer.fromColors(
                            baseColor: AppColors.greyScale.grey300,
                            highlightColor: AppColors.white,
                            child: Container(
                              width: appW(305),
                              height: appH(70),
                              decoration: BoxDecoration(
                                color: AppColors.greyScale.grey300,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: AppColors.greyScale.grey300,
                          highlightColor: AppColors.white,
                          child: Container(
                            width: appW(345),
                            height: appH(80),
                            decoration: BoxDecoration(
                              color: AppColors.greyScale.grey300,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: appH(40)),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: appH(16)),
                          child: Shimmer.fromColors(
                            baseColor: AppColors.greyScale.grey300,
                            highlightColor: AppColors.white,
                            child: Row(
                              children: [
                                Container(
                                  width: appW(30),
                                  height: appH(30),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.greyScale.grey300,
                                  ),
                                ),
                                SizedBox(width: appW(12)),
                                Expanded(
                                  child: Container(
                                    height: appH(24),
                                    decoration: BoxDecoration(
                                      color: AppColors.greyScale.grey300,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (state is FinalTestByIdError) {
            return Center(child: Text('Error loading question'));
          } else if (state is FinalTestByIdLoaded) {
            final question = state.response.data;
            return Column(
              children: [
                SizedBox(height: appH(30)),
                Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 40,
                        top: -20,
                        child: card(Colors.blue.shade100, appW(265), '', ''),
                      ),
                      Positioned(
                        left: 20,
                        top: -10,
                        child: card(Colors.blue.shade200, appW(305), '', ''),
                      ),
                      card(
                        Colors.blue.shade500,
                        appW(345),
                        question.question,
                        question.task,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: appH(35)),
                Expanded(
                  child: ListView.builder(
                    itemCount: question.options.length,
                    itemBuilder: (context, index) {
                      final option = question.options[index];
                      final isSelected = widget.selectedOptionId == option.id;
                      return ListTile(
                        leading: Container(
                          width: appW(30),
                          height: appH(30),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color:
                                  isSelected
                                      ? AppColors.secondBlue
                                      : Color(0xffDAE1E9),
                              width: 2,
                            ),
                            color:
                                isSelected
                                    ? AppColors.secondBlue
                                    : Colors.transparent,
                          ),
                          child:
                              isSelected
                                  ? Center(
                                    child: Icon(
                                      Icons.check,
                                      color: AppColors.white,
                                    ),
                                  )
                                  : null,
                        ),
                        title: Text(
                          option.title,
                          style: AppTextStyles.source.regular(
                            color: AppColors.black,
                            fontSize: 14,
                          ),
                        ),
                        onTap: () {
                          widget.onOptionSelected(option.id);
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
