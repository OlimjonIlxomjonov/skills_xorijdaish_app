import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/faqs/faqs_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/faqs/faqs_state.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    context.read<FaqsBloc>().add(FaqsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(titleText: AppStrings.faq),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(20), vertical: appH(30)),
        child: BlocBuilder<FaqsBloc, FaqsState>(
          builder: (context, state) {
            if (state is FaqsLoaded) {
              return ListView.builder(
                itemCount: state.response.data.length,
                itemBuilder: (context, index) {
                  final faq = state.response.data[index];
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: appW(20),
                      vertical: appH(20),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.inputGreyColor.withValues(
                            alpha: 0.3,
                          ),
                          spreadRadius: 1,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      spacing: isVisible ? 10 : 0,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                faq.title,
                                style: AppTextStyles.source.semiBold(
                                  color: AppColors.black,
                                  fontSize: 18,
                                ),
                              ),
                              Icon(
                                !isVisible
                                    ? IconlyBold.arrow_down_2
                                    : IconlyBold.arrow_up_2,
                                color: AppColors.appBg,
                                size: appW(24),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: isVisible,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 10,
                            children: [
                              Divider(color: AppColors.greyScale.grey200),
                              Text(faq.description),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
