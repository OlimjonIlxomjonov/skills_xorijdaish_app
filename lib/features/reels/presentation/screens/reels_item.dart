import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skills_xorijdaish/features/reels/domain/entity/reels_entity.dart';
import 'package:skills_xorijdaish/features/reels/presentation/screens/reels_video_overlay.dart';
import 'package:skills_xorijdaish/features/reels/presentation/screens/reels_video_page.dart';

import '../../../../core/common/constants/colors/app_colors.dart';
import '../../../../core/common/textstyles/app_text_styles.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';
import '../bloc/put_like/like_bloc.dart';
import '../bloc/reels_event.dart';

class ReelItem extends StatefulWidget {
  final ReelsEntity reel;

  const ReelItem({super.key, required this.reel});

  @override
  State<ReelItem> createState() => _ReelItemState();
}

class _ReelItemState extends State<ReelItem> {
  late bool isLiked;
  late int localLikes;

  @override
  void initState() {
    super.initState();
    isLiked = widget.reel.isLiked;
    localLikes = widget.reel.likes;
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      localLikes += isLiked ? 1 : -1;
    });

    context.read<LikeBloc>().add(LikeEvent(widget.reel.id));
  }

  void shareReel(String url) {
    Share.share(url, subject: "Check out this reel!");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ReelVideoOverlay(
          onLike: toggleLike,
          child: ReelVideo(url: widget.reel.url!),
        ),

        Positioned(
          bottom: 24,
          left: 20,
          right: 80,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.reel.title ?? 'No Title',
                  style: AppTextStyles.source.bold(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.reel.text ?? 'No Desc',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.source.regular(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),

        Positioned(
          right: 20,
          bottom: 24,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: toggleLike,
                  icon: Icon(
                    isLiked ? IconlyBold.heart : IconlyLight.heart,
                    color: isLiked ? AppColors.red : Colors.white,
                    size: appH(30),
                  ),
                ),
                Text('$localLikes', style: TextStyle(color: Colors.white)),
                SizedBox(height: 24),
                Icon(IconlyBold.show, color: Colors.white, size: 30),
                Text(
                  '${widget.reel.views}',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 24),
                IconButton(
                  onPressed: () {
                    shareReel(widget.reel.link!);
                  },
                  icon: Icon(IconlyBold.send, color: Colors.white, size: 30),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
