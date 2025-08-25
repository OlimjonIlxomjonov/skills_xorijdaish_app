import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_vectors.dart';
import 'package:video_player/video_player.dart';
import 'package:skills_xorijdaish/core/services/token_storage/token_storage_service_impl.dart';

import '../../../../core/utils/responsiveness/app_responsive.dart';

class M3u8VideoPlayer extends StatefulWidget {
  final String videoUrl;
  final VoidCallback onVideoEnd;
  final String imageUrl;

  const M3u8VideoPlayer({
    super.key,
    required this.videoUrl,
    required this.onVideoEnd,
    required this.imageUrl,
  });

  @override
  State<M3u8VideoPlayer> createState() => _M3u8VideoPlayerState();
}

class _M3u8VideoPlayerState extends State<M3u8VideoPlayer> {
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;
  bool _isInitialized = false;
  bool _hasStarted = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo(widget.videoUrl);
  }

  Future<void> _initializeVideo(String rawUrl) async {
    rawUrl = rawUrl.trim();
    if (rawUrl.isEmpty) return;

    final token = await TokenStorageServiceImpl().getAccessToken();

    _videoController = VideoPlayerController.network(
      rawUrl,
      httpHeaders: {'Authorization': 'Bearer $token'},
      formatHint: VideoFormat.hls,
    );

    try {
      await _videoController!.initialize();

      _videoController!.addListener(() {
        final isEnded =
            _videoController!.value.position >=
                _videoController!.value.duration &&
            !_videoController!.value.isPlaying;

        if (isEnded) {
          widget.onVideoEnd();
        }
      });

      _chewieController = ChewieController(
        videoPlayerController: _videoController!,
        autoPlay: false,
        looping: false,
        showControls: true,
        aspectRatio: _videoController!.value.aspectRatio,
        showOptions: false,
        allowPlaybackSpeedChanging: false,
        allowMuting: false,
        customControls: MaterialDesktopControls(showPlayButton: false),
      );

      setState(() => _isInitialized = true);
    } catch (e) {
      debugPrint('Video init error: $e');
    }
  }

  @override
  void dispose() {
    _videoController?.pause();
    _chewieController?.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: appH(10),
            horizontal: appW(20),
          ),
          height: appH(200),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }

    if (!_hasStarted) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _hasStarted = true;
            _chewieController?.play();
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: _videoController!.value.aspectRatio,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (_, __, ___) => Container(
                        color: Colors.black12,
                        child: Icon(Icons.broken_image, size: 40),
                      ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black54,
              ),
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                AppVectors.play,
                color: AppColors.white,
                width: appW(20),
                height: appH(20),
              ),
            ),
          ],
        ),
      );
    }
    return AspectRatio(
      aspectRatio: _videoController!.value.aspectRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Chewie(controller: _chewieController!),
      ),
    );
  }
}
