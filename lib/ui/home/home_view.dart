import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tik_tok_clone/model/tik_tok.dart';
import 'package:tik_tok_clone/ui/constants/styles.dart';
import 'package:tik_tok_clone/ui/constants/ui_const.dart';
import 'package:tik_tok_clone/ui/home/main_content_layout/video_info.dart';
import 'package:tik_tok_clone/ui/home/widgets/bottom_navigation.dart';
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

///This class in incharge of controlling the stream for following and For You videos.
///
class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        MainContentLayout(),
        TopSwitcher(),
        BottomNavigation(),
      ],
    );
  }
}

class MainContentLayout extends StatelessWidget {
  MainContentLayout();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (_, index) {
          return ContentView(tikTok: TikTok().generate());
        });
  }
}

class ContentView extends StatelessWidget {
  final TikTok tikTok;

  ContentView({@required this.tikTok});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          child: ClipPath(
            clipper: CustomClipTheVideo(),
            child: FullScreenVideo('assets/videos/${tikTok.videoUrl}'),
          ),
        ),
        SideActions(tikTok),
        VideoInfo(tikTok),
      ],
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
