import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/reels/presentation/bloc/get_reels/reels_bloc.dart';
import 'package:skills_xorijdaish/features/reels/presentation/bloc/reels_event.dart';
import 'package:skills_xorijdaish/features/reels/presentation/screens/reels_item.dart';

import '../../../../core/common/constants/colors/app_colors.dart';
import '../bloc/get_reels/reels_state.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ReelsBloc>().add(GetReelsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: BlocBuilder<ReelsBloc, ReelsState>(
        builder: (context, state) {
          if (state is ReelsLoaded) {
            return PageView.builder(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: state.response.meta.total,
              itemBuilder: (context, index) {
                if (index < state.response.data.length) {
                  final reels = state.response.data[index];

                  return ReelItem(key: ValueKey(reels.id), reel: reels);
                } else {
                  final currentPage = state.response.meta.currentPage;
                  final lastPage = state.response.meta.lastPage;
                  context.read<ReelsBloc>().add(
                    GetReelsEvent(
                      page:
                          lastPage != currentPage
                              ? currentPage + 1
                              : currentPage,
                    ),
                  );
                  return SizedBox.shrink();
                }
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
