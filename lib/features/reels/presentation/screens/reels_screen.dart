import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/features/reels/presentation/bloc/reels_event.dart';
import 'package:skills_xorijdaish/features/reels/presentation/screens/reels_page.dart';

import '../bloc/get_reels/reels_bloc.dart';
import '../bloc/get_reels/reels_state.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final PageController _pageController = PageController();
  double currentPage = 0;

  @override
  void initState() {
    super.initState();
    context.read<ReelsBloc>().add(GetReelsEvent());
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<ReelsBloc, ReelsState>(
        builder: (context, state) {
          if (state is ReelsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ReelsLoaded) {
            final reels = state.response.data;
            return Stack(
              children: [
                NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    print("Scrolled: \${scrollNotification.metrics.pixels}");
                    return false;
                  },
                  child: PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    itemCount: reels.length,
                    itemBuilder: (context, index) {
                      final item = reels[index];
                      final double distance = (currentPage - index).abs();
                      final double opacity = (1.0 - distance).clamp(0.0, 1.0);
                      return ReelItem(reel: item, opacity: opacity);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      AppStrings.videos,
                      style: AppTextStyles.source.semiBold(
                        color: AppColors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is ReelsError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}