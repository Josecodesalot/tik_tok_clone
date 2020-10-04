import 'package:flutter/material.dart';
import 'package:tik_tok_clone/ui/constants/styles.dart';
import 'package:tik_tok_clone/ui/constants/ui_const.dart';
import 'package:tik_tok_clone/ui/home/main_content_layout/video_info.dart';
import 'package:tik_tok_clone/ui/home/widgets/bottom_navigation.dart';
import 'package:tik_tok_clone/ui/home/widgets/top_switcher.dart';
import 'package:tik_tok_clone/ui/widgets/full_screen_video.dart';

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

  final videoUrls = <String>[
    'assets/videos/video0.mov',
    'assets/videos/video1.mov',
    'assets/videos/video2.mov',
    'assets/videos/video3.mov',
    'assets/videos/video4.mov',
  ];
  final contentViews = <Widget>[
    ContentView(videoUrl: 'assets/videos/video0.mov'),
    ContentView(videoUrl: 'assets/videos/video1.mov'),
    ContentView(videoUrl: 'assets/videos/video2.mov'),
    ContentView(videoUrl: 'assets/videos/video3.mov'),
    ContentView(videoUrl: 'assets/videos/video4.mov'),
  ];

  @override
  Widget build(BuildContext context) {
    return PageView(
        scrollDirection: Axis.vertical,
        children: videoUrls.map((String url) {
          return ContentView(
            videoUrl: url,
          );
        }).toList());
  }
}

class ContentView extends StatelessWidget {
  final String videoUrl;

  ContentView({@required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: FullScreenVideo(videoUrl),
          ),
        ),
        SideActions(),
        VideoInfo(),
      ],
    );
  }
}

class SideActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(right: 16),
      alignment: Alignment.centerRight,
      child: Column(children: <Widget>[
        Spacer(),
        _profileButton(),
        _sideButton("1233"),
        _sideButton("1233"),
        _sideButton("1233"),
        SizedBox(
          height: height * 0.3,
        )
      ]),
    );
  }

  Widget _sideButton(String count) {
    return Column(
      children: <Widget>[
        Icon(
          Icons.message,
          color: Colors.white,
          size: 34,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          '$count',
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
                image: DecorationImage(image: NetworkImage(kPlaceHolderImage))),
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
