import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class Rotate extends StatelessWidget {
  final Widget child;
  final Duration duration;

  Rotate({@required this.child, this.duration});

  @override
  Widget build(BuildContext context) {
    return LoopAnimation<double>(
      tween: Tween(begin: 0.0, end: 6.28319),
      duration: duration ?? Duration(milliseconds: 2000),
      builder: (_, child, rotation) {
        return Transform.rotate(
          angle: rotation,
          child: child,
        );
      },
      child: this.child,
    );
  }
}
