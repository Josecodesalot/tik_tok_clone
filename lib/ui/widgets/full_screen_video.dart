import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideo extends StatefulWidget {
  final String asset;

  FullScreenVideo(this.asset);

  @override
  _FullScreenVideoState createState() => _FullScreenVideoState();
}

class _FullScreenVideoState extends State<FullScreenVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      widget.asset,
    )..initialize().then((_) {
        setState(() {
          _controller.play();
          _controller.setLooping(true);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
