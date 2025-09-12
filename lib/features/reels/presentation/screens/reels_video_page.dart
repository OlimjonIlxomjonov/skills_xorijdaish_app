import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ReelVideo extends StatefulWidget {
  final String url;

  const ReelVideo({super.key, required this.url});

  @override
  State<ReelVideo> createState() => ReelVideoState();
}

class ReelVideoState extends State<ReelVideo> {
  late FlickManager flickManager;
  bool _showPlayPauseIcon = false;
  IconData _currentIcon = Icons.play_arrow;
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();
    print("Simple ReelVideo initState called");
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.url),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    _hideTimer?.cancel();
    super.dispose();
  }

  void togglePlayPause() {
    print("togglePlayPause called!");
    final controller = flickManager.flickVideoManager?.videoPlayerController;
    if (controller != null) {
      if (controller.value.isPlaying) {
        controller.pause();
        _currentIcon = Icons.play_arrow;
        print(" Video paused");
      } else {
        controller.play();
        _currentIcon = Icons.pause;
        print(" Video playing");
      }
      setState(() => _showPlayPauseIcon = true);
      _hideTimer?.cancel();
      _hideTimer = Timer(Duration(milliseconds: 800), () {
        if (mounted) setState(() => _showPlayPauseIcon = false);
      });
    } else {
      print(" Controller is null!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.url),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.7) {
          flickManager.flickControlManager?.play();
        } else {
          flickManager.flickControlManager?.pause();
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          FlickVideoPlayer(
            flickManager: flickManager,
            flickVideoWithControls: FlickVideoWithControls(
              controls: Container(),
              videoFit: BoxFit.cover,
              playerLoadingFallback: SizedBox.shrink(),
              playerErrorFallback: SizedBox.shrink(),
            ),
            flickVideoWithControlsFullscreen: FlickVideoWithControls(
              controls: Container(),
              playerLoadingFallback: SizedBox.shrink(),
              playerErrorFallback: SizedBox.shrink(),
            ),
          ),
          AnimatedOpacity(
            opacity: _showPlayPauseIcon ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.black.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                _currentIcon,
                size: 30,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
