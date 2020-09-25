import 'package:flutter/material.dart';
import 'package:tik_tok_clone/ui/constants/styles.dart';
import 'package:tik_tok_clone/ui/constants/ui_const.dart';
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
            MainContentControl(),
            Container(
              alignment: Alignment.center,
              child: Text(
                'User Profile here',
                style: baseStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///This class in incharge of controlling the stream for following and For You videos.
///
class MainContentControl extends StatelessWidget {
  final bottomNavHeight = 64.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        MainContentLayout(bottomNavHeight),
        TopSwitcher(),
        BottomNavigation(bottomNavHeight),
      ],
    );
  }
}

class MainContentLayout extends StatelessWidget {
  final double bottomNavHeight;

  MainContentLayout(this.bottomNavHeight);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: List.generate(5, (index) {
        return ContentView(
          bottomNavHeight: bottomNavHeight,
        );
      }),
    );
  }
}

class ContentView extends StatelessWidget {
  final double bottomNavHeight;

  ContentView({this.bottomNavHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: .5),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: bottomNavHeight),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FullScreenVideo('assets/videos/video0.mp4'),
            ),
          ),
          SideActions(),
        ],
      ),
    );
  }

  Widget _roundTheCorners({double radius, Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 6.0),
      child: child,
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
          size: 32,
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
            decoration: roundDecoration.copyWith(
              border: Border.all(color: Colors.white, width: 2.0),
              color: Colors.black,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 12,
              width: 12,
              alignment: Alignment.center,
              decoration: roundDecoration.copyWith(
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
    return Scaffold();
  }
}
