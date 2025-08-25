import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/final_listen_n_complete/final_listen_n_complete_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/final_listen_n_complete/final_listen_n_complete_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/listen_n_complete/listen_n_complete_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/listen_n_complete/listen_n_complete_state.dart';

import '../../../../../../../core/common/textstyles/app_text_styles.dart';
import '../../../../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../widgets/listen_test_card.dart';
import '../../../../widgets/test_card.dart';

class FinalListenNCompeltePage extends StatefulWidget {
  final int courseId;
  final int questionId;
  final String testType;
  final TextEditingController textEditingController;

  const FinalListenNCompeltePage({
    super.key,
    required this.courseId,
    required this.questionId,
    required this.testType,
    required this.textEditingController,
  });

  @override
  State<FinalListenNCompeltePage> createState() =>
      _FinalListenNCompeltePageState();
}

class _FinalListenNCompeltePageState extends State<FinalListenNCompeltePage> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    logger.f(widget.testType);
    _audioPlayer.onPlayerComplete.listen((event) {
      if (mounted) {
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  bool isPlaying = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<
        FetchFinalListenNCompleteBloc,
        FetchFinalListenNCompleteState
      >(
        builder: (context, state) {
          if (state is FinalListenNCompleteLoading) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
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
            );
          } else if (state is FinalListenNCompleteLoaded) {
            final question = state.entity.task;
            return Column(
              children: [
                SizedBox(height: appH(40)),
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
                      listenTestCard(
                        Colors.blue.shade500,
                        appW(345),
                        question,
                        "Вопрос ${widget.questionId}",
                        TextField(
                          controller: widget.textEditingController,
                          decoration: InputDecoration(
                            hintText: 'Введите текст',
                            hintStyle: AppTextStyles.source.regular(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.white),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.white),
                            ),
                          ),
                          style: TextStyle(color: AppColors.white),
                        ),
                        state.entity.audioUrl ?? '',
                        isPlaying,
                        () async {
                          if (isPlaying) {
                            await _audioPlayer.stop();
                          } else {
                            await _audioPlayer.play(
                              UrlSource(state.entity.audioUrl ?? ''),
                            );
                          }
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is ListenNCompleteError) {
            return Text('check logs!');
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
