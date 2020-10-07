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
    _controller = VideoPlayerController.asset(
      widget.asset,
    )..initialize().then((_) {
        setState(() {
          _controller.play();
          _controller.setLooping(true);
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.initialize(),
      builder: (BuildContext context, _) {
        _controller.play();
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final aspect = constraints.maxWidth / constraints.maxHeight;
            return OverflowBox(
              maxHeight: aspect > _controller.value.aspectRatio
                  ? double.infinity
                  : null,
              maxWidth: aspect < _controller.value.aspectRatio
                  ? double.infinity
                  : null,
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: ColoredBox(
                  color: Colors.red,
                  child: VideoPlayer(
                    _controller,
                  ),
                ),
              ),
            );
          },
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
