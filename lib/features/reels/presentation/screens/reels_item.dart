import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skills_xorijdaish/features/reels/domain/entity/reels_entity.dart';
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

class _ReelItemState extends State<ReelItem>
    with SingleTickerProviderStateMixin {
  late bool isLiked;
  late int localLikes;
  bool _showHeart = false;
  late AnimationController _heartController;
  final GlobalKey<ReelVideoState> _videoKey = GlobalKey<ReelVideoState>();

  @override
  void initState() {
    super.initState();
    isLiked = widget.reel.isLiked;
    localLikes = widget.reel.likes;
    _heartController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _heartController.dispose();
    super.dispose();
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      localLikes += isLiked ? 1 : -1;
      _showHeart = true;
    });
    _heartController.forward(from: 0);
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) setState(() => _showHeart = false);
    });
    context.read<LikeBloc>().add(LikeEvent(widget.reel.id));
  }

  void handleVideoTap() {
    _videoKey.currentState?.togglePlayPause();
  }

  void shareReel(String url) {
    Share.share(url, subject: "Check out this reel!");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ReelVideo(key: _videoKey, url: widget.reel.url!),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Colors.black.withValues(alpha: 0.3),
                  Colors.transparent,
                ],
                stops: [0.0, 0.2],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [Colors.black.withValues(alpha: 0.3), Colors.transparent],
                stops: [0.0, 0.3],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              handleVideoTap();
            },
            onDoubleTap: () {
              toggleLike();
            },
            child: Container(color: Colors.transparent),
          ),
        ),
        if (_showHeart)
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: ScaleTransition(
                  scale: CurvedAnimation(
                    parent: _heartController,
                    curve: Curves.elasticOut,
                  ),
                  child: Icon(IconlyBold.heart, color: Colors.red, size: 120),
                ),
              ),
            ),
          ),
        Positioned(
          bottom: 24,
          left: 20,
          right: 80,
          child: IgnorePointer(
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
        ),
        Positioned(
          right: 20,
          bottom: 24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  toggleLike();
                },
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
      ],
    );
  }
}
