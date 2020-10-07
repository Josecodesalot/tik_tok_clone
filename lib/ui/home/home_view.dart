import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tik_tok_clone/model/tik_tok.dart';
import 'package:tik_tok_clone/ui/constants/styles.dart';
import 'package:tik_tok_clone/ui/constants/ui_const.dart';
import 'package:tik_tok_clone/ui/home/main_content_layout/video_info.dart';
import 'package:tik_tok_clone/ui/home/widgets/bottom_navigation.dart';
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
          padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: FullScreenVideo('assets/videos/${tikTok.videoUrl}'),
          ),
        ),
        SideActions(tikTok),
        VideoInfo(tikTok),
      ],
    );
  }
}

class SideActions extends StatelessWidget {
  final TikTok tikTok;

  SideActions(this.tikTok);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(right: 16),
      alignment: Alignment.centerRight,
      child: Column(children: <Widget>[
        Spacer(),
        _profileButton(),
        _sideButton(icon: Icons.favorite, value: tikTok.likes),
        _sideButton(icon: Icons.comment, value: tikTok.comments),
        _sideButton(icon: Icons.share, value: tikTok.shares),
        SizedBox(
          height: height * 0.3,
        )
      ]),
    );
  }

  Widget _sideButton({IconData icon, int value}) {
    return Column(
      children: <Widget>[
        Icon(
          icon ?? Icons.message,
          color: Colors.white,
          size: 34,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          '$value',
          style: baseStyle.copyWith(fontSize: 12),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }

  _profileButton() {
    return Container(
      height: 60,
      width: 48,
      margin: const EdgeInsets.only(bottom: 24),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: kRoundDecoration.copyWith(
                border: Border.all(color: Colors.white, width: 2.0),
                color: Colors.black,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(tikTok.user.imgUrl))),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 12,
              width: 12,
              alignment: Alignment.center,
              decoration: kRoundDecoration.copyWith(
                color: Colors.red,
              ),
              child: Text(
                '+',
                style: baseStyle,
              ),
            ),
          )
        ],
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
