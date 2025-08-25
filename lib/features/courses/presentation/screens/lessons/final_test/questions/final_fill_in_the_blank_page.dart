import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/filil_in_the_blank/fetch_final_fill_in_the_blank_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/filil_in_the_blank/fetch_final_fill_in_the_blank_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/fill_in_the_blank/fill_in_the_blank_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/fill_in_the_blank/fill_in_the_blank_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/widgets/test_card_with_picture.dart';
import '../../../../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../widgets/test_card.dart';

class FinalFillInTheBlankPage extends StatefulWidget {
  final int courseId;
  final int questionId;
  final List<int> selectedId;

  const FinalFillInTheBlankPage({
    super.key,
    required this.courseId,
    required this.questionId,
    required this.selectedId,
  });

  @override
  State<FinalFillInTheBlankPage> createState() =>
      _FinalFillInTheBlankPageState();
}

class _FinalFillInTheBlankPageState extends State<FinalFillInTheBlankPage> {
  String? selectedWord;

  String buildFilledQuestion(String question, String? selectedWord) {
    if (selectedWord == null) return question;

    return question.replaceFirst(RegExp(r'_+'), selectedWord);
  }

  @override
  void initState() {
    super.initState();

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<
        FetchFinalFillInTheBlankBloc,
        FetchFinalFillInTheBlankState
      >(
        builder: (context, state) {
          if (state is FetchFinalFillInTheBlankLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FetchFinalFillInTheBlankLoaded) {
            final question = state.entity;
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
                      testCardWithPicture(
                        Colors.blue.shade500,
                        appW(345),
                        question.question.contains('_')
                            ? buildFilledQuestion(
                              question.question,
                              selectedWord,
                            )
                            : question.question,
                        question.tasks,
                        question.audioUrl ?? '',
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
                        question.imageUrl ?? '',
                        question.isImageAvailable,
                        question.isAudioAvailable,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: appH(40)),
                Expanded(
                  child: Wrap(
                    spacing: appW(12),
                    runSpacing: appH(12),
                    alignment: WrapAlignment.center,
                    children:
                        state.entity.options.map((option) {
                          final isSelected = selectedWord == option.title;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  selectedWord = null;
                                } else {
                                  selectedWord = option.title;
                                  widget.selectedId.add(option.id);
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? Colors.blue.shade100
                                        : Color(0xffF7F7F8),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color:
                                      isSelected
                                          ? Colors.blue
                                          : Color(0xffE0E0E0),
                                ),
                              ),
                              child: Text(
                                option.title,
                                style: AppTextStyles.source.regular(
                                  color: AppColors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
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
