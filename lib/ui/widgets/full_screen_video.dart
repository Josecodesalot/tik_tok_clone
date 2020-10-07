import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideo extends StatefulWidget {
  final String asset;

  FullScreenVideo(this.asset, {Key key}) : super(key: key);

  @override
  _FullScreenVideoState createState() => _FullScreenVideoState();
}

class _FullScreenVideoState extends State<FullScreenVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(
      widget.asset,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.initialize(),
      builder: (BuildContext context, _) {
        print("${widget.asset} playing");
        _controller.play();
        _controller.setLooping(true);
        return VideoPlayer(
          _controller,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
