import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class Notes extends StatelessWidget {
  final double height;
  final double width;
  final int duration;

  Notes({this.height, this.width, this.duration});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          NoteAnimator(
            duration: duration,
            height: height,
            width: width,
            first: true,
            delay: Duration(milliseconds: 0),
          ),
          NoteAnimator(
            height: height,
            width: width,
            duration: duration,
            first: false,
            delay: Duration(milliseconds: (duration * 1.6).round()),
          ),
        ],
      ),
    );
  }
}

class MusicNote extends StatelessWidget {
  final bool single;

  MusicNote({bool single}) : single = single;

  @override
  Widget build(BuildContext context) {
    return single
        ? Icon(
            Icons.music_note,
            color: Colors.white,
          )
        : Icon(
            FontAwesomeIcons.itunesNote,
            color: Colors.white,
          );
  }
}

enum AniProps { width, height, fade, rotation, size, skewY, skewX }

class NoteAnimator extends StatelessWidget {
  final int duration;
  final MultiTween<AniProps> _tween;
  final bool first;
  final double height;
  final double width;
  final Duration delay;

  NoteAnimator(
      {this.duration,
      bool first,
      this.delay,
      @required this.height,
      @required this.width})
      : first = first ?? false,
        _tween = MultiTween<AniProps>()
          ..add(AniProps.width, 1.0.tweenTo(.3),
              (duration * 2.5).toInt().milliseconds)
          ..add(AniProps.height, 1.0.tweenTo(0.0), (duration * 2).milliseconds)
          ..add(AniProps.fade, 1.0.tweenTo(0.0), (duration * 2).milliseconds)
          ..add(AniProps.size, 0.4.tweenTo(1.0), (duration * 2).milliseconds)
          ..add(AniProps.skewY, 0.0.tweenTo(0.2), (duration * 2).milliseconds)
          ..add(AniProps.skewX, 0.0.tweenTo(0.5), (duration * 2).milliseconds)
          ..add(AniProps.rotation, 0.0.tweenTo(1.1),
              (duration * (first ? 2 : 1.5)).toInt().milliseconds);

  @override
  Widget build(BuildContext context) {
    return CustomAnimation<MultiTweenValues<AniProps>>(
      control: CustomAnimationControl.LOOP,
      delay: delay,
      tween: _tween,
      duration: _tween.duration,
      builder: (context, child, value) {
        return Stack(
          children: [
            Positioned(
              top: height * value.get(AniProps.height),
              left: width * value.get(AniProps.width),
              child: Opacity(
                opacity: value.get(AniProps.fade),
                child: Transform.rotate(
                  angle: value.get(AniProps.rotation),
                  child: Transform.scale(
                    scale: value.get(AniProps.size),
                    child: Transform(
                      transform: Matrix4.skewX(value.get(AniProps.skewX)),
                      child: Transform(
                          transform: Matrix4.skewY(value.get(AniProps.skewY)),
                          child: MusicNote(
                            single: first,
                          )),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
