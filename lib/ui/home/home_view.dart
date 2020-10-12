import 'package:flutter/material.dart';
import 'package:tik_tok_clone/model/tik_tok.dart';
import 'package:tik_tok_clone/ui/constants/ui_const.dart';
import 'package:tik_tok_clone/ui/home/main_content_layout/video_info.dart';
import 'package:tik_tok_clone/ui/home/widgets/bottom_navigation.dart';
import 'package:tik_tok_clone/ui/home/widgets/note.dart';
import 'package:tik_tok_clone/ui/home/widgets/side_actions.dart';
import 'package:tik_tok_clone/ui/home/widgets/top_switcher.dart';
import 'package:tik_tok_clone/ui/widgets/full_screen_video.dart';
import 'package:tik_tok_clone/util/extensions/tik_tok_extensions.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Content(),
            UserInfoPage(),
          ],
        ),
      ),
    );
  }
}

///This class in incharge of controlling the stream
///for following and For You videos.

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ContentView(),
        TopSwitcher(),
        BottomNavigation(),
      ],
    );
  }
}

class ContentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (_, __) {
        final tikTok = TikTok().generate();

        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: ClipPath(
                clipper: CustomClipTheVideo(),
                child: FullScreenVideo(
                  'assets/videos/${tikTok.videoUrl}',
                ),
              ),
            ),
            MusicNoteLayer(),
            SideActions(tikTok),
            VideoInfo(tikTok),
          ],
        );
      },
    );
  }
}

class MusicNoteLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(bottom: kBottomNavigationBarHeight + 24, right: 56),
      alignment: Alignment.bottomRight,
      child: Notes(
        height: 90,
        width: 70,
        duration: 1200,
      ),
    );
  }
}

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'User Profile here',
        style: baseStyle,
      ),
    );
  }
}

class CustomClipTheVideo extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    return Path()
      ..addRRect(RRect.fromLTRBR(0, 0, size.width,
          size.height - kBottonNavBarheight + 8, Radius.circular(8.0)));
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return this != oldClipper;
  }
}
