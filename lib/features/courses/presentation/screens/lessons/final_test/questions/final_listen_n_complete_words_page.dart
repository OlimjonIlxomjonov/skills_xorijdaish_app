import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/listen_n_complete_words/fetch_final_listen_n_complete_words_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/listen_n_complete_words/fetch_final_listen_n_complete_words_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/listen_n_complete_words/listen_n_compelte_words_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/listen_n_complete_words/listen_n_complete_words_state.dart';

import '../../../../../../../core/common/textstyles/app_text_styles.dart';
import '../../../../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../widgets/listen_test_card.dart';
import '../../../../widgets/test_card.dart';

class FinalListenNCompleteWordsPage extends StatefulWidget {
  final int courseId;
  final int questionId;
  final List<int> selectedWordsId;

  const FinalListenNCompleteWordsPage({
    super.key,
    required this.courseId,
    required this.questionId,
    required this.selectedWordsId,
  });

  @override
  State<FinalListenNCompleteWordsPage> createState() =>
      _FinalListenNCompleteWordsPageState();
}

class _FinalListenNCompleteWordsPageState
    extends State<FinalListenNCompleteWordsPage> {
  List<String> selectedWords = [];
  List<int> selectedWordsId = [];

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
        FetchFinalListenNCompleteWordsBloc,
        FetchFinalListenNCompleteWordsState
      >(
        builder: (context, state) {
          if (state is FetchFinalListenNCompleteWordsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FetchFinalListenNCompleteWordsLoaded) {
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
                        state.entity.task,
                        "Вопрос ${widget.questionId}",
                        TextField(
                          decoration: InputDecoration(
                            hintText: selectedWords.join(' '),
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
                          readOnly: true,
                          style: TextStyle(color: AppColors.white),
                        ),
                        state.entity.audioUrl,
                        isPlaying,
                        () async {
                          if (isPlaying) {
                            await _audioPlayer.stop();
                          } else {
                            await _audioPlayer.play(
                              UrlSource(state.entity.audioUrl),
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
                SizedBox(height: appH(50)),
                Wrap(
                  spacing: appW(12),
                  runSpacing: appH(12),
                  alignment: WrapAlignment.center,
                  children:
                      state.entity.options.map((option) {
                        final isSelected = selectedWords.contains(option.title);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedWords.contains(option.title)) {
                                selectedWords.remove(option.title);
                                selectedWordsId.remove(option.id);
                                widget.selectedWordsId.remove(option.id);
                              } else {
                                selectedWords.add(option.title);
                                selectedWordsId.add(option.id);
                                widget.selectedWordsId.add(option.id);
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
              ],
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
