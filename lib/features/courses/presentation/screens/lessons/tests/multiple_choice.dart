import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../../core/common/textstyles/app_text_styles.dart';
import '../../../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../bloc/lesson_tests/test_by_id/single_test_bloc.dart';
import '../../../bloc/lesson_tests/test_by_id/single_test_state.dart';
import '../../../widgets/test_card.dart';

class MultipleChoice extends StatefulWidget {
  final int? selectedOptionId;
  final ValueChanged<int> onOptionSelected;

  const MultipleChoice({
    super.key,
    required this.selectedOptionId,
    required this.onOptionSelected,
  });

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<SingleTestBloc, SingleTestState>(
        builder: (context, state) {
          if (state is SingleTestLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SingleTestError) {
            return Center(child: Text('Error loading question'));
          } else if (state is SingleTestLoaded) {
            final question = state.response.data;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: appW(20)),
              child: Column(
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
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
