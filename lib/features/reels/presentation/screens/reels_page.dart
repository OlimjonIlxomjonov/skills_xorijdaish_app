import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/reels/domain/entity/reels_entity.dart';
import 'package:video_player/video_player.dart';

class ReelItem extends StatefulWidget {
  final ReelsEntity reel;
  final double opacity;

  const ReelItem({super.key, required this.reel, required this.opacity});

  @override
  State<ReelItem> createState() => _ReelItemState();
}

class _ReelItemState extends State<ReelItem> {
  VideoPlayerController? _controller;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    if (widget.reel.url != null && widget.reel.url!.isNotEmpty) {
      _controller = VideoPlayerController.network(widget.reel.url ?? '')
        ..initialize()
            .then((_) {
              setState(() {});
              _controller?.play();
              _controller?.setLooping(true);
            })
            .catchError((e) {
              debugPrint('❌ Video init failed: $e');
            });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _controller != null && _controller!.value.isInitialized
            ? SizedBox.expand(
              child: IgnorePointer(
                ignoring: true,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller!.value.size.width,
                    height: _controller!.value.size.height,
                    child: VideoPlayer(_controller!),
                  ),
                ),
              ),
            )
            : const Center(
              child: Text(
                '⚠️ Video unavailable',
                style: TextStyle(color: Colors.white),
              ),
            ),
        Positioned(
          bottom: 24,
          left: 20,
          right: 80,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: widget.opacity,
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
            opacity: widget.opacity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  icon: Icon(
                    isLiked ? IconlyBold.heart : IconlyLight.heart,
                    color: isLiked ? AppColors.red : Colors.white,
                    size: appH(30),
                  ),
                ),
                Text(
                  '${widget.reel.likes}',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 24),
                const Icon(IconlyBold.show, color: Colors.white, size: 30),
                Text(
                  '${widget.reel.views}',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 24),
                const Icon(IconlyBold.send, color: Colors.white, size: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
