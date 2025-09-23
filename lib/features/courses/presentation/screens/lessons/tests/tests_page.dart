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
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/answer_fill_in_the_blank/answer_fill_in_the_blank_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/answer_to_test/answer_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/listen_n_selet_pairs/listen_n_select_pairs_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/select_pairs/selcet_pairs_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/test_by_id/single_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/tests/finish_test_page.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/tests/questions/fill_in_the_blank_page.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/tests/questions/listen_n_complete_page.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/tests/questions/listen_n_complete_words.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/tests/questions/listen_n_select_pairs.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/tests/questions/multiple_choice.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/tests/questions/multiple_choice_with_picures_page.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/tests/questions/select_pairs.dart';

import '../../../../../../core/common/textstyles/app_text_styles.dart';
import '../../../bloc/courses_event.dart';
import '../../../bloc/lesson_tests/answer_listen_n_complete/answer_liste_complete_bloc.dart';
import '../../../bloc/lesson_tests/listen_n_complete/listen_n_complete_bloc.dart';

class TestsPage extends StatefulWidget {
  final int courseId;
  final int lessonId;
  final List<int> questionId;
  final List<String> testType;

  const TestsPage({
    super.key,
    required this.courseId,
    required this.lessonId,
    required this.questionId,
    required this.testType,
  });

  @override
  State<TestsPage> createState() => _TestsPageState();
}

class _TestsPageState extends State<TestsPage> {
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
    context.read<SingleTestBloc>().add(
      SingleTestEvent(widget.courseId, widget.lessonId, currentQuestionId),
    );
    context.read<SelectPairsBloc>().add(
      SelectPairsEvent(widget.courseId, widget.lessonId, currentQuestionId),
    );
    context.read<ListenNCompleteBloc>().add(
      ListenNCompleteEvent(widget.courseId, widget.lessonId, currentQuestionId),
    );
    context.read<ListenNSelectPairsBloc>().add(
      ListenNSelectPairsEvent(
        widget.courseId,
        widget.lessonId,
        currentQuestionId,
      ),
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

      context.read<AnswerBloc>().add(
        AnswerEvent(
          widget.courseId,
          widget.lessonId,
          questionId,
          testType,
          selectedOptionId!,
        ),
      );
    }

    if (testType == 'multiple-choice-with-pictures') {
      if (selectedOptionId == null) {
        logger.w('Cannot be empty!');
        return;
      }

      context.read<AnswerBloc>().add(
        AnswerEvent(
          widget.courseId,
          widget.lessonId,
          questionId,
          testType,
          selectedOptionId!,
        ),
      );
    }

    if (testType == 'listen-and-complete') {
      final answer = listenController.text.trim();
      if (answer.isEmpty) {
        logger.w('Enter your answer');
        return;
      }

      context.read<AnswerListenCompleteBloc>().add(
        AnswerListenCompleteEvent(
          widget.courseId,
          widget.questionId[currentIndex],
          testType,
          answer,
          widget.lessonId,
        ),
      );
    }

    if (testType == 'fill-in-the-blank') {
      if (selectedId.isEmpty) {
        logger.w('Select an option');
        return;
      }

      context.read<AnswerFillInTheBlankBloc>().add(
        AnswerFillInTheBlankEvent(
          widget.courseId,
          widget.lessonId,
          questionId,
          testType,
          selectedId,
        ),
      );
    }
    if (testType == 'listen-and-complete-words') {
      if (selectedWordsId.isEmpty) {
        logger.w('Select an option!');
        return;
      }
      context.read<AnswerFillInTheBlankBloc>().add(
        AnswerFillInTheBlankEvent(
          widget.courseId,
          widget.lessonId,
          questionId,
          testType,
          selectedWordsId,
        ),
      );
      logger.f(selectedWordsId);
    }

    if (currentIndex < widget.questionId.length - 1) {
      setState(() {
        currentIndex++;
        selectedOptionId = null;
        listenController.clear();
      });
      _loadQuestion();
    } else {
      AppRoute.replace(
        FinishTestPage(courseId: widget.courseId, lessonId: widget.lessonId),
      );
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
                  child: SafeArea(
                    child: BasicButtonWg(
                      text: 'Tasdiqlash',
                      onTap: _submitAnswer,
                    ),
                  ),
                ),
      ),
    );
  }

  Widget buildTestBody() {
    final type = widget.testType[currentIndex];
    switch (type) {
      case 'multiple-choice':
        return MultipleChoice(
          selectedOptionId: selectedOptionId,
          onOptionSelected: (id) {
            setState(() {
              selectedOptionId = id;
            });
          },
        );

      case 'select-pairs':
        return SelectPairs(
          courseId: widget.courseId,
          lessonId: widget.lessonId,
          questionId: widget.questionId[currentIndex],
          testType: widget.testType[currentIndex],
          onTestCompleted: () {
            if (currentIndex < widget.questionId.length - 1) {
              setState(() {
                currentIndex++;
              });
              _loadQuestion();
            } else {
              AppRoute.replace(
                FinishTestPage(
                  courseId: widget.courseId,
                  lessonId: widget.lessonId,
                ),
              );
            }
          },
        );

      case 'listen-and-complete':
        return ListenNCompletePage(
          courseId: widget.courseId,
          lessonId: widget.lessonId,
          questionId: widget.questionId[currentIndex],
          testType: widget.testType[currentIndex],
          textEditingController: listenController,
        );

      case 'fill-in-the-blank':
        return FillInTheBlankPage(
          courseId: widget.courseId,
          lessonId: widget.lessonId,
          questionId: widget.questionId[currentIndex],
          selectedId: selectedId,
        );

      case 'listen-and-complete-words':
        return ListenNCompleteWordsPage(
          lessonId: widget.lessonId,
          courseId: widget.courseId,
          questionId: widget.questionId[currentIndex],
          selectedWordsId: selectedWordsId,
        );

      case 'multiple-choice-with-pictures':
        return MultipleChoiceWithPicturesPage(
          courseId: widget.courseId,
          lessonId: widget.lessonId,
          questionId: widget.questionId[currentIndex],
          onOptionSelected: (id) {
            setState(() {
              selectedOptionId = id;
            });
          },
        );
      case 'listen-and-select-pairs':
        return ListenNSelectPairs(
          courseId: widget.courseId,
          lessonId: widget.lessonId,
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
                  FinishTestPage(
                    courseId: widget.courseId,
                    lessonId: widget.lessonId,
                  ),
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
