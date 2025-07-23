import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:skills_xorijdaish/core/services/token_storage/token_storage_service_impl.dart';

import '../../../../core/utils/responsiveness/app_responsive.dart';

class M3u8VideoPlayer extends StatefulWidget {
  final String videoUrl;
  final VoidCallback onVideoEnd;

  const M3u8VideoPlayer({
    super.key,
    required this.videoUrl,
    required this.onVideoEnd,
  });

  @override
  State<M3u8VideoPlayer> createState() => _M3u8VideoPlayerState();
}

class _M3u8VideoPlayerState extends State<M3u8VideoPlayer> {
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;
  bool _isInitialized = false;

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
        customControls: const MaterialDesktopControls(showPlayButton: true),
      );

      setState(() => _isInitialized = true);
    } catch (e) {
      debugPrint('❌ Video init error: $e');
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
    if (!_isInitialized) {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: appH(10),
            horizontal: appW(16),
          ),
          height: appH(188),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }
    return AspectRatio(
      aspectRatio: _videoController!.value.aspectRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Chewie(controller: _chewieController!),
      ),
    );
  }
}
