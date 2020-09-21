import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tok_clone/ui/constants/styles.dart';
import 'package:tik_tok_clone/ui/home/widgets/bottom_navigation.dart';
import 'package:tik_tok_clone/ui/home/widgets/top_switcher.dart';
import 'package:tik_tok_clone/ui/widgets/full_screen_video.dart';
import 'package:tik_tok_clone/view_model/main_model.dart';

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
    return Consumer<MainModel>(
      builder: (_, model, child) {
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            MainContentLayout(bottomNavHeight),
            TopSwitcher(),
            BottomNavigation(bottomNavHeight),
          ],
        );
      },
    );
  }
}

class MainContentLayout extends StatelessWidget {
  final double bottomNavHeight;

  MainContentLayout(this.bottomNavHeight);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
    return Container();
  }
}

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
