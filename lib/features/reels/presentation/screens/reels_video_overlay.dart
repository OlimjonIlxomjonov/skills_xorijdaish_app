import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ReelVideoOverlay extends StatefulWidget {
  final Widget child;
  final VoidCallback onLike;

  const ReelVideoOverlay({
    super.key,
    required this.child,
    required this.onLike,
  });

  @override
  State<ReelVideoOverlay> createState() => _ReelVideoOverlayState();
}

class _ReelVideoOverlayState extends State<ReelVideoOverlay>
    with SingleTickerProviderStateMixin {
  bool _showHeart = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _triggerLike() {
    widget.onLike();
    setState(() => _showHeart = true);
    _controller.forward(from: 0); // restart animation
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) setState(() => _showHeart = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: _triggerLike,
      child: Stack(
        alignment: Alignment.center,
        children: [
          widget.child,
          if (_showHeart)
            ScaleTransition(
              scale: CurvedAnimation(
                parent: _controller,
                curve: Curves.elasticOut,
              ),
              child: Icon(IconlyBold.heart, color: Colors.red, size: 100),
            ),
        ],
      ),
    );
  }
}
