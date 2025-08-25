import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/widgets/button/basic_button_wg.dart';
import 'package:skills_xorijdaish/core/common/widgets/flush_bar/flush_bar_wg.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/filil_in_the_blank/fetch_final_fill_in_the_blank_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/final_listen_n_complete/final_listen_n_complete_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/listen_n_select_pairs/fetch_final_listen_n_seletc_pairs_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/multiple_choice_with_pictures/fetch_final_multiple_choice_with_pictures_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/select_pairs/fetch_final_select_pairs_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/final_test_answers/fill_in_the_blank/fill_in_the_blank_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/final_test_answers/listen_n_complete_words/listen_n_complete_words_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/final_test_answers/multiple_choice/final_multiple_choice_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/final_test_answers/multiple_choice_with_pictures/final_multiple_choice_with_pictures_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/final_test_by_id/final_test_by_id_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/final_test/questions/final_fill_in_the_blank_page.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/final_test/questions/final_liste_n_select_pairs_page.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/final_test/questions/final_listen_n_compelte_page.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/final_test/questions/final_listen_n_complete_words_page.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/final_test/questions/final_multiple_chocie_with_pictures_page.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/final_test/questions/final_multiple_choice.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/final_test/questions/final_select_pairs_page.dart';

import '../../../../../../core/common/textstyles/app_text_styles.dart';
import '../../../bloc/courses_event.dart';
import '../../../bloc/fetch_final_test/listen_n_complete_words/fetch_final_listen_n_complete_words_bloc.dart';
import '../../../bloc/final_test_answers/listen_and_complete/listen_n_complete_bloc.dart';
import 'finish_final_test_page.dart';

class FinalTestPage extends StatefulWidget {
  final int courseId;
  final List<int> questionId;
  final List<String> testType;

  const FinalTestPage({
    super.key,
    required this.courseId,
    required this.questionId,
    required this.testType,
  });

  @override
  State<FinalTestPage> createState() => _FinalTestPageState();
}

class _FinalTestPageState extends State<FinalTestPage> {
  int currentIndex = 0;
  int? selectedOptionId;
  List<int> selectedId = [];
  List<int> selectedWordsId = [];

  @override
  void initState() {
    super.initState();
    _loadQuestion();
  }

  void _showExitConfirmationDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            title: Text(
              'Ogohlantirish!',
              style: AppTextStyles.source.medium(
                color: AppColors.black,
                fontSize: 24,
              ),
            ),
            content: Text('Sizning progress yo‘qoladi. Chiqishni xohlaysizmi?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Bekor qilish'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  AppRoute.close();
                },
                child: Text('Ha, chiqish'),
              ),
            ],
          ),
    );
  }

  void _loadQuestion() {
    final currentQuestionId = widget.questionId[currentIndex];
    context.read<FinalTestByIdBloc>().add(
      FinalTestByIdEvent(widget.courseId, currentQuestionId),
    );
    context.read<FetchFinalListenNCompleteBloc>().add(
      FinalTestResponseEvent(currentQuestionId, widget.courseId),
    );

    context.read<FetchFinalFillInTheBlankBloc>().add(
      FinalTestResponseEvent(currentQuestionId, widget.courseId),
    );
    context.read<FetchFinalListenNCompleteWordsBloc>().add(
      FinalTestResponseEvent(currentQuestionId, widget.courseId),
    );
    context.read<FetchFinalMultipleChoiceWithPicturesBloc>().add(
      FinalTestResponseEvent(currentQuestionId, widget.courseId),
    );
    context.read<FetchFinalSelectPairsBloc>().add(
      FinalTestResponseEvent(currentQuestionId, widget.courseId),
    );
    context.read<FetchFinalListenNSelectPairsBloc>().add(
      FinalTestResponseEvent(currentQuestionId, widget.courseId),
    );
  }

  final TextEditingController listenController = TextEditingController();

  Future<void> _submitAnswer() async {
    final questionId = widget.questionId[currentIndex];
    final testType = widget.testType[currentIndex];

    if (testType == 'multiple-choice') {
      if (selectedOptionId == null) {
        logger.w('Select an option');
        return;
      }

      context.read<FinalMultipleChoiceBloc>().add(
        FinalMultipleChoiceEvent(
          widget.courseId,
          questionId,
          selectedOptionId!,
          testType,
        ),
      );
    }

    if (testType == 'multiple-choice-with-pictures') {
      if (selectedOptionId == null) {
        logger.w('Cannot be empty!');
        return;
      }
      context.read<FinalMultipleChoiceWithPicturesBloc>().add(
        FinalMultipleChoiceWithPicturesEvent(
          widget.courseId,
          questionId,
          selectedOptionId!,
          testType,
        ),
      );
    }

    if (testType == 'listen-and-complete') {
      final answer = listenController.text.trim();
      if (answer.isEmpty) {
        logger.w('Enter your answer');
        return;
      }
      context.read<FinalListenNCompleteBloc>().add(
        FinalListenNCompleteEvent(
          widget.courseId,
          questionId,
          answer,
          testType,
        ),
      );
    }

    if (testType == 'fill-in-the-blank') {
      if (selectedId.isEmpty) {
        logger.w('Select an option');
        return;
      }
      context.read<FinalFillInTheBlankBloc>().add(
        FinalFillInTheBlankEvent(
          courseId: widget.courseId,
          questionId: questionId,
          testType: testType,
          answerIds: selectedId,
        ),
      );
    }
    if (testType == 'listen-and-complete-words') {
      if (selectedWordsId.isEmpty) {
        logger.w('Select an option!');
        return;
      }

      context.read<FinalListenNCompleteWordsBloc>().add(
        FinalListenNCompleteWordsEvent(
          courseId: widget.courseId,
          questionId: questionId,
          testType: testType,
          answerIds: selectedWordsId,
        ),
      );
    }

    if (currentIndex < widget.questionId.length - 1) {
      setState(() {
        currentIndex++;
        selectedOptionId = null;
        listenController.clear();
      });
      _loadQuestion();
    } else {
      AppRoute.replace(FinishFinalTestPage(courseId: widget.courseId));
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = (currentIndex + 1) / widget.questionId.length;
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: IconButton(
            style: IconButton.styleFrom(highlightColor: Colors.transparent),
            onPressed: _showExitConfirmationDialog,
            icon: Icon(IconlyLight.arrow_left),
          ),
          backgroundColor: AppColors.white,
          title: LinearPercentIndicator(
            padding: EdgeInsets.zero,
            animation: false,
            lineHeight: appH(14),
            percent: progress,
            backgroundColor: Colors.grey.shade200,
            barRadius: Radius.circular(16),
            progressColor: AppColors.secondBlue,
          ),
        ),
        body: Column(
          children: [
            Text(
              "${currentIndex + 1} / ${widget.questionId.length}",
              style: AppTextStyles.source.regular(
                color: AppColors.black,
                fontSize: 14,
              ),
            ),

            Expanded(child: buildTestBody()),
          ],
        ),
        bottomNavigationBar:
            widget.testType[currentIndex] == 'select-pairs' ||
                    widget.testType[currentIndex] == 'listen-and-select-pairs'
                ? null
                : Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: appW(24),
                    vertical: appH(22),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.greyScale.grey200,
                        spreadRadius: 20,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: BasicButtonWg(
                    text: 'Tasdiqlash',
                    onTap: _submitAnswer,
                  ),
                ),
      ),
    );
  }

  Widget buildTestBody() {
    final type = widget.testType[currentIndex];
    switch (type) {
      case 'multiple-choice':
        return FinalMultipleChoice(
          selectedOptionId: selectedOptionId,
          onOptionSelected: (id) {
            setState(() {
              selectedOptionId = id;
            });
          },
        );
      case 'listen-and-complete':
        return FinalListenNCompeltePage(
          courseId: widget.courseId,
          questionId: widget.questionId[currentIndex],
          testType: widget.testType[currentIndex],
          textEditingController: listenController,
        );

      case 'fill-in-the-blank':
        return FinalFillInTheBlankPage(
          courseId: widget.courseId,
          questionId: widget.questionId[currentIndex],
          selectedId: selectedId,
        );
      case 'listen-and-complete-words':
        return FinalListenNCompleteWordsPage(
          courseId: widget.courseId,
          questionId: widget.questionId[currentIndex],
          selectedWordsId: selectedWordsId,
        );
      case 'multiple-choice-with-pictures':
        return FinalMultipleChocieWithPicturesPage(
          courseId: widget.courseId,
          questionId: widget.questionId[currentIndex],
          onOptionSelected: (id) {
            setState(() {
              selectedOptionId = id;
            });
          },
        );
      case 'select-pairs':
        return FinalSelectPairsPage(
          courseId: widget.courseId,
          questionId: widget.questionId[currentIndex],
          testType: widget.testType[currentIndex],
          onTestCompleted: () {
            if (currentIndex < widget.questionId.length - 1) {
              setState(() {
                currentIndex++;
                selectedOptionId = null;
                selectedId.clear();
                selectedWordsId.clear();
                listenController.clear();
              });
              _loadQuestion();
            } else {
              AppRoute.replace(FinishFinalTestPage(courseId: widget.courseId));
            }
          },
        );
      case 'listen-and-select-pairs':
        return FinalListeNSelectPairsPage(
          courseId: widget.courseId,
          questionId: widget.questionId[currentIndex],
          testType: widget.testType[currentIndex],
          onTestComplete: () {
            if (currentIndex + 1 < widget.questionId.length) {
              setState(() {
                currentIndex++;
              });
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _loadQuestion();
              });
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AppRoute.replace(
                  FinishFinalTestPage(courseId: widget.courseId),
                );
              });
            }
          },
        );
      default:
        return Center(child: Text('Unknown test type'));
    }
  }
}
