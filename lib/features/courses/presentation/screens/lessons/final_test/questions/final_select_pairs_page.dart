import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/button/basic_button_wg.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/select_pairs/fetch_final_select_pairs_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/select_pairs/fetch_final_select_pairs_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/final_test_answers/select_pairs/final_select_pairs_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/answer_to_select_pairs/answer_select_pairs_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/answer_to_select_pairs/answer_select_pairs_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/select_pairs/selcet_pairs_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/select_pairs/select_pairs_state.dart';

import '../../../../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../bloc/final_test_answers/select_pairs/final_select_pairs_bloc.dart';
import '../../../../widgets/test_card.dart';

class FinalSelectPairsPage extends StatefulWidget {
  final int courseId;
  final int questionId;
  final String testType;
  final VoidCallback? onTestCompleted;

  const FinalSelectPairsPage({
    super.key,
    required this.courseId,
    required this.questionId,
    required this.testType,
    this.onTestCompleted,
  });

  @override
  State<FinalSelectPairsPage> createState() => _FinalSelectPairsPageState();
}

class _FinalSelectPairsPageState extends State<FinalSelectPairsPage> {
  final Set<int> _usedOptionIds = {};
  final Set<String> _usedPairTexts = {};

  List<MapEntry<int, String>> confirmedPairs = [];

  int optionIndex = 0;

  int selectedOptionId = 0;
  String selectedPairText = '';

  void _onOptionsSelected(int id) {
    setState(() {
      selectedOptionId = id;
    });
    _checkAndSubmit();
  }

  void _onPairSelected(String pair) {
    setState(() {
      selectedPairText = pair;
    });
    _checkAndSubmit();
  }

  @override
  void didUpdateWidget(covariant FinalSelectPairsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.questionId != widget.questionId) {
      setState(() {
        confirmedPairs.clear();
        _usedOptionIds.clear();
        _usedPairTexts.clear();
        selectedOptionId = 0;
        selectedPairText = '';
      });
    }
  }

  void _checkAndSubmit() {
    if (selectedOptionId != 0 && selectedPairText.isNotEmpty) {
      context.read<FinalSelectPairsBloc>().add(
        FinalSelectPairsEvent(
          widget.courseId,
          widget.questionId,
          selectedOptionId,
          widget.testType,
          selectedPairText,
        ),
      );
    }
  }

  void _onAnswerSuccess() {
    setState(() {
      confirmedPairs.add(MapEntry(selectedOptionId, selectedPairText));
      _usedOptionIds.add(selectedOptionId);
      _usedPairTexts.add(selectedPairText);
      selectedOptionId = 0;
      selectedPairText = '';
    });

    final totalPairs =
        context.read<FetchFinalSelectPairsBloc>().state
                is FetchFinalSelectPairsLoaded
            ? (context.read<FetchFinalSelectPairsBloc>().state
                    as FetchFinalSelectPairsLoaded)
                .response
                .data
                .options
                .length
            : 0;

    if (confirmedPairs.length == totalPairs) {
      if (widget.onTestCompleted != null) {
        widget.onTestCompleted!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocListener<FinalSelectPairsBloc, FinalSelectPairsState>(
        listener: (context, state) {
          if (state is FinalSelectPairsLoaded) {
            _onAnswerSuccess();
          }
        },
        child: BlocBuilder<
          FetchFinalSelectPairsBloc,
          FetchFinalSelectPairsState
        >(
          builder: (context, state) {
            if (state is FetchFinalSelectPairsLoading) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: appW(20),
                  vertical: appH(30),
                ),
                child: Column(
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
                            padding: EdgeInsets.only(bottom: appH(20)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Shimmer.fromColors(
                                    baseColor: AppColors.greyScale.grey300,
                                    highlightColor: AppColors.white,
                                    child: Container(
                                      height: appH(60),
                                      decoration: BoxDecoration(
                                        color: AppColors.greyScale.grey300,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: appW(20)),
                                Expanded(
                                  child: Shimmer.fromColors(
                                    baseColor: AppColors.greyScale.grey300,
                                    highlightColor: AppColors.white,
                                    child: Container(
                                      height: appH(60),
                                      decoration: BoxDecoration(
                                        color: AppColors.greyScale.grey300,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
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
            } else if (state is FetchFinalSelectPairsLoaded) {
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
                            child: card(
                              Colors.blue.shade100,
                              appW(265),
                              '',
                              '',
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: -10,
                            child: card(
                              Colors.blue.shade200,
                              appW(305),
                              '',
                              '',
                            ),
                          ),
                          card(
                            Colors.blue.shade500,
                            appW(345),
                            question.task,
                            'Вопрос ${widget.questionId}',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: appH(35)),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.response.data.options.length,
                        itemBuilder: (context, index) {
                          final pairOptions =
                              state.response.data.options[index];
                          final pairTexts =
                              state.response.data.pairTexts[index];
                          final isSelected = selectedOptionId == pairOptions.id;
                          final isPairSelected = selectedPairText == pairTexts;
                          final isUsedOption = _usedOptionIds.contains(
                            pairOptions.id,
                          );
                          final isUsedPair = _usedPairTexts.contains(pairTexts);
                          final optionIndexInPairs = confirmedPairs.indexWhere(
                            (entry) => entry.key == pairOptions.id,
                          );
                          final pairIndexInPairs = confirmedPairs.indexWhere(
                            (entry) => entry.value == pairTexts,
                          );

                          return Row(
                            spacing: appW(20),
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap:
                                      isUsedOption
                                          ? null
                                          : () {
                                            setState(() {
                                              selectedOptionId = pairOptions.id;
                                              _onOptionsSelected(
                                                selectedOptionId,
                                              );
                                            });
                                          },

                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          isUsedOption
                                              ? Colors.grey.shade200
                                              : isSelected
                                              ? Color(0xffF7F7F8)
                                              : Colors.transparent,

                                      border: Border.all(
                                        color:
                                            isSelected
                                                ? AppColors.blue
                                                : Color(0xffE0E0E0),
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: ListTile(
                                      title: Text(
                                        pairOptions.title,
                                        style: AppTextStyles.source.medium(
                                          color:
                                              isSelected
                                                  ? Color(0xff363B44)
                                                  : AppColors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                      leading: Container(
                                        width: appW(25),
                                        height: appH(25),
                                        decoration: BoxDecoration(
                                          color: AppColors.inputGreyColor,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child:
                                            optionIndexInPairs != -1
                                                ? Center(
                                                  child: Text(
                                                    (optionIndexInPairs + 1)
                                                        .toString(),
                                                    style: AppTextStyles.source
                                                        .bold(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 14,
                                                        ),
                                                  ),
                                                )
                                                : null,
                                      ),
                                      contentPadding: EdgeInsets.only(left: 10),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap:
                                      isUsedPair
                                          ? null
                                          : () {
                                            setState(() {
                                              selectedPairText = pairTexts;
                                              _onPairSelected(selectedPairText);
                                            });
                                          },

                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            isPairSelected
                                                ? AppColors.blue
                                                : Color(0xffE0E0E0),
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      color:
                                          isUsedPair
                                              ? Colors.grey.shade200
                                              : isPairSelected
                                              ? Color(0xffF7F7F8)
                                              : Colors.transparent,
                                    ),
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: ListTile(
                                      title: Text(
                                        pairTexts,
                                        style: AppTextStyles.source.medium(
                                          color: AppColors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                      leading: Container(
                                        width: appW(25),
                                        height: appH(25),
                                        decoration: BoxDecoration(
                                          color: AppColors.inputGreyColor,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child:
                                            pairIndexInPairs != -1
                                                ? Center(
                                                  child: Text(
                                                    (pairIndexInPairs + 1)
                                                        .toString(),
                                                    style: AppTextStyles.source
                                                        .bold(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 14,
                                                        ),
                                                  ),
                                                )
                                                : null,
                                      ),
                                      contentPadding: EdgeInsets.only(
                                        left: appW(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
