import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/listen_n_selet_pairs/listen_n_select_pairs_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/listen_n_selet_pairs/listen_n_select_pairs_state.dart';

import '../../../../../../../core/common/textstyles/app_text_styles.dart';
import '../../../../../../../core/configs/assets/app_vectors.dart';
import '../../../../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../bloc/lesson_tests/answer_to_select_pairs/answer_select_pairs_bloc.dart';
import '../../../../bloc/lesson_tests/answer_to_select_pairs/answer_select_pairs_state.dart';

class ListenNSelectPairs extends StatefulWidget {
  final int courseId;
  final int lessonId;
  final int questionId;
  final String testType;
  final VoidCallback? onTestComplete;

  const ListenNSelectPairs({
    super.key,
    required this.courseId,
    required this.lessonId,
    required this.questionId,
    required this.testType,
    this.onTestComplete,
  });

  @override
  State<ListenNSelectPairs> createState() => _ListenNSelectPairsState();
}

class _ListenNSelectPairsState extends State<ListenNSelectPairs> {
  int selectedOption = 0;
  String selectedPair = '';
  List<MapEntry<int, String>> confirmedPairs = [];
  final Set<int> _usedOptionIds = {};
  final Set<String> _usedPairTexts = {};

  @override
  void initState() {
    super.initState();
    context.read<ListenNSelectPairsBloc>().add(
      ListenNSelectPairsEvent(
        widget.courseId,
        widget.lessonId,
        widget.questionId,
      ),
    );

    _audioPlayer.onPlayerComplete.listen((event) {
      if (mounted) {
        setState(() {
          currentlyPlayingIndex = null;
        });
      }
    });
  }

  int? currentlyPlayingIndex;
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _onOptionsSelected(int id) {
    setState(() {
      selectedOption = id;
    });
    _checkAndSubmit();
  }

  void _onPairSelected(String pair) {
    setState(() {
      selectedPair = pair;
    });
    _checkAndSubmit();
  }

  void _checkAndSubmit() {
    if (selectedOption != 0 && selectedPair.isNotEmpty) {
      context.read<AnswerSelectPairsBloc>().add(
        AnswerSelectPairsEvent(
          widget.courseId,
          widget.lessonId,
          widget.questionId,
          widget.testType,
          selectedOption,
          selectedPair,
        ),
      );
    }
  }

  void _onAnswerSuccess() {
    setState(() {
      confirmedPairs.add(MapEntry(selectedOption, selectedPair));
      _usedOptionIds.add(selectedOption);
      _usedPairTexts.add(selectedPair);
      selectedOption = 0;
      selectedPair = '';
    });

    final totalPairs =
        context.read<ListenNSelectPairsBloc>().state is ListenNSelectPairsLoaded
            ? (context.read<ListenNSelectPairsBloc>().state
                    as ListenNSelectPairsLoaded)
                .entity
                .options
                .length
            : 0;

    if (confirmedPairs.length == totalPairs) {
      if (widget.onTestComplete != null) {
        widget.onTestComplete!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocListener<AnswerSelectPairsBloc, AnswerSelectPairsState>(
        listener: (context, state) {
          if (state is AnswerSelectPairsLoaded) {
            _onAnswerSuccess();
          }
        },
        child: BlocBuilder<ListenNSelectPairsBloc, ListenNSelectPairsState>(
          builder: (context, state) {
            if (state is ListenNSelectPairsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ListenNSelectPairsLoaded) {
              final select = state.entity;
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: appW(20),
                  vertical: appH(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      select.task,
                      style: AppTextStyles.source.medium(
                        color: AppColors.black,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: appH(20)),
                    Expanded(
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        itemCount: state.entity.options.length,
                        itemBuilder: (context, index) {
                          final options = state.entity.options[index];
                          final pairs = state.entity.pairTexts[index];
                          final isOptionSelected = selectedOption == options.id;
                          final isPairSelected = selectedPair == pairs;

                          final isUsedOption = _usedOptionIds.contains(
                            options.id,
                          );
                          final isUsedPair = _usedPairTexts.contains(pairs);

                          final optionIndexInPairs = confirmedPairs.indexWhere(
                            (entry) => entry.key == options.id,
                          );
                          final pairIndexInPairs = confirmedPairs.indexWhere(
                            (entry) => entry.value == pairs,
                          );
                          return Row(
                            spacing: 20,
                            children: [
                              /// OPTIONS
                              Expanded(
                                child: GestureDetector(
                                  onTap:
                                      isUsedOption
                                          ? null
                                          : () {
                                            setState(() {
                                              selectedOption = options.id;
                                              _onOptionsSelected(
                                                selectedOption,
                                              );
                                            });
                                          },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          isUsedOption
                                              ? Colors.grey.shade200
                                              : isOptionSelected
                                              ? Color(0xffF7F7F8)
                                              : Colors.transparent,
                                      border: Border.all(
                                        color:
                                            isOptionSelected
                                                ? AppColors.blue
                                                : Color(0xffE0E0E0),
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: ListTile(
                                      leading: Container(
                                        width: appW(25),
                                        height: appH(25),
                                        decoration: BoxDecoration(
                                          color: AppColors.inputGreyColor,
                                          borderRadius: BorderRadius.circular(
                                            5,
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
                                      title: Row(
                                        spacing: 5,
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              if (currentlyPlayingIndex ==
                                                  index) {
                                                await _audioPlayer.stop();
                                                setState(() {
                                                  currentlyPlayingIndex = null;
                                                });
                                              } else {
                                                await _audioPlayer.play(
                                                  UrlSource(options.audioUrl),
                                                );
                                                setState(() {
                                                  currentlyPlayingIndex = index;
                                                });
                                              }
                                            },
                                            child:
                                                currentlyPlayingIndex == index
                                                    ? Icon(
                                                      Icons.stop,
                                                      color:
                                                          AppColors.secondBlue,
                                                      size: appW(25),
                                                    )
                                                    : Icon(
                                                      Icons.volume_up,
                                                      color:
                                                          AppColors.secondBlue,
                                                      size: appW(25),
                                                    ),
                                          ),
                                          SvgPicture.asset(AppVectors.spWaves),
                                        ],
                                      ),
                                      contentPadding: EdgeInsets.only(left: 10),
                                    ),
                                  ),
                                ),
                              ),

                              /// PAIRS =================
                              Expanded(
                                child: GestureDetector(
                                  onTap:
                                      isUsedPair
                                          ? null
                                          : () {
                                            setState(() {
                                              selectedPair = pairs;
                                              _onPairSelected(selectedPair);
                                            });
                                          },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          isUsedPair
                                              ? Colors.grey.shade200
                                              : isPairSelected
                                              ? Color(0xffF7F7F8)
                                              : Colors.transparent,
                                      border: Border.all(
                                        color:
                                            isPairSelected
                                                ? AppColors.blue
                                                : Color(0xffE0E0E0),
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: ListTile(
                                      leading: Container(
                                        width: appW(25),
                                        height: appH(25),
                                        decoration: BoxDecoration(
                                          color: AppColors.inputGreyColor,
                                          borderRadius: BorderRadius.circular(
                                            5,
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
                                      title: Text(
                                        pairs,
                                        style: AppTextStyles.source.medium(
                                          color: Color(0xff363B44),
                                          fontSize: 16,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.only(left: 10),
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
