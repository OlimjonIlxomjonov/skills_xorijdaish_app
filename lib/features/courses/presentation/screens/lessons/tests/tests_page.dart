import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/widgets/button/basic_button_wg.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/answer_to_test/answer_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/test_by_id/single_test_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/tests/multiple_choice.dart';

import '../../../bloc/courses_event.dart';

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

  @override
  void initState() {
    super.initState();
    _loadQuestion();
  }

  void _loadQuestion() {
    final currentQuestionId = widget.questionId[currentIndex];
    context.read<SingleTestBloc>().add(
      SingleTestEvent(widget.courseId, widget.lessonId, currentQuestionId),
    );
  }

  Future<void> _submitAnswer() async {
    final questionId = widget.questionId[currentIndex];
    final testType = widget.testType[currentIndex];

    if (selectedOptionId == null) {
      logger.w('Select option first!');
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

    if (currentIndex < widget.questionId.length - 1) {
      setState(() {
        currentIndex++;
        selectedOptionId = null;
      });
      _loadQuestion();
    } else {
      AppRoute.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = (currentIndex + 1) / widget.questionId.length;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          style: IconButton.styleFrom(highlightColor: Colors.transparent),
          onPressed: () => AppRoute.close(),
          icon: Icon(IconlyLight.arrow_left),
        ),
        toolbarHeight: 30,
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.close),
            style: IconButton.styleFrom(highlightColor: Colors.transparent),
          ),
        ],
      ),
      body:
          widget.testType.contains('multiple-choice')
              ? MultipleChoice(
                selectedOptionId: selectedOptionId,
                onOptionSelected: (int id) {
                  setState(() {
                    selectedOptionId = id;
                  });
                },
              )
              : Text('Not in range'),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: appW(24), vertical: appH(22)),
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
        child: BasicButtonWg(text: 'Tasdiqlash', onTap: _submitAnswer),
      ),
    );
  }
}
