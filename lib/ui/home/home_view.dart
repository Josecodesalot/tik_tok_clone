import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        child: Stack(
          children: <Widget>[
            PageView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                MainContentView(),
                Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

///This class in incharge of controlling the stream for following and For You videos.
///
class MainContentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainModel>(
      builder: (_, model, child) {
        return PageView(
          children: <Widget>[
            Stack(
              fit: StackFit.expand,
              children: <Widget>[
                ContentView(),
                TopSwitcher(),
//        BottomNavigation(),
              ],
            ),
          ],
        );
      },
    );
  }
}

class ContentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _roundTheCorners(
      radius: 6.0,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FullScreenVideo('assets/videos/video0.mp4'),
          SideActions(),
          BottomNavigation(),
        ],
      ),
    );
  }

  Widget _roundTheCorners({double radius, Stack child}) {
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
