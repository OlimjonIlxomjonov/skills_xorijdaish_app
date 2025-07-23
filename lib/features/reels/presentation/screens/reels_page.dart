import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:chewie/chewie.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_vectors.dart';
import 'package:skills_xorijdaish/features/reels/presentation/bloc/reels_event.dart';
import 'package:video_player/video_player.dart';
import 'package:skills_xorijdaish/core/services/token_storage/token_storage_service_impl.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/reels/domain/entity/reels_entity.dart';

import '../bloc/put_like/like_bloc.dart';

class ReelItem extends StatefulWidget {
  final ReelsEntity reel;
  final double opacity;
  final bool isVisible;

  const ReelItem({
    super.key,
    required this.reel,
    required this.opacity,
    required this.isVisible,
  });

  @override
  State<ReelItem> createState() => _ReelItemState();
}

class _ReelItemState extends State<ReelItem> {
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;
  late bool isLiked;
  bool isInitialized = false;
  late int localLikes;
  bool _showPlayButton = false;

  @override
  void didUpdateWidget(covariant ReelItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_videoController != null) {
      if (widget.isVisible) {
        _videoController!.play();
      } else {
        _videoController!.pause();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    isLiked = widget.reel.isLiked;
    localLikes = widget.reel.likes;
    _setupPlayer();
  }

  Future<void> _setupPlayer() async {
    final token = await TokenStorageServiceImpl().getAccessToken();

    if (widget.reel.url != null && widget.reel.url!.isNotEmpty) {
      _videoController = VideoPlayerController.network(
        widget.reel.url!,
        httpHeaders: {"Authorization": "Bearer $token"},
      );

      await _videoController!.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoController!,
        autoPlay: true,
        looping: true,
        showControls: false,
        aspectRatio: _videoController!.value.aspectRatio,
      );

      setState(() => isInitialized = true);
    }
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildVideoPlayer(),
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
                      localLikes += isLiked ? 1 : -1;
                    });
                    context.read<LikeBloc>().add(LikeEvent(widget.reel.id));
                  },
                  icon: Icon(
                    isLiked ? IconlyBold.heart : IconlyLight.heart,
                    color: isLiked ? AppColors.red : Colors.white,
                    size: appH(30),
                  ),
                ),
                Text(
                  '$localLikes',
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 24),
                const Icon(IconlyBold.show, color: Colors.white, size: 30),
                Text(
                  '${widget.reel.views}',
                  style: const TextStyle(color: Colors.white),
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

  Widget _buildVideoPlayer() {
    if (_chewieController != null &&
        _chewieController!.videoPlayerController.value.isInitialized) {
      return GestureDetector(
        onTap: () {
          final video = _videoController!;
          setState(() {
            if (video.value.isPlaying) {
              video.pause();
              _showPlayButton = true;
            } else {
              video.play();
              _showPlayButton = false;
            }
          });
        },
        child: Stack(
          children: [
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _videoController!.value.size.width,
                  height: _videoController!.value.size.height,
                  child: Chewie(controller: _chewieController!),
                ),
              ),
            ),
            if (_showPlayButton)
              Center(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: SvgPicture.asset(
                    AppVectors.play,
                    width: appW(20),
                    height: appH(20),
                    color: const Color(0xff003F97),
                  ),
                ),
              ),
          ],
        ),
      );
    } else {
      return const Center(
        child: SizedBox(
          height: 55,
          width: 55,
          child: LoadingIndicator(
            indicatorType: Indicator.ballRotateChase,
            colors: [Colors.white],
            strokeWidth: 2,
          ),
        ),
      );
    }
  }
}
