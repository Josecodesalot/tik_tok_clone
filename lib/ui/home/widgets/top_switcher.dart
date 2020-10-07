import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';
import 'package:tik_tok_clone/ui/constants/ui_const.dart';

class TopSwitcher extends StatefulWidget {
  @override
  _TopSwitcherState createState() => _TopSwitcherState();
}

class _TopSwitcherState extends State<TopSwitcher> {
  bool followingSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        width: 190,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final height = constraints.maxHeight;
            final width = constraints.maxWidth;
            return Stack(
              children: <Widget>[
                Positioned(
                    left: 0,
                    bottom: height * 0.94,
                    child: _selectedText(namedFollowing: true)),
                Positioned(
                    left: (width / 2) + 4,
                    bottom: height * 0.945,
                    child: _separator()),
                Positioned(
                    right: 0,
                    bottom: height * 0.94,
                    child: _selectedText(namedFollowing: false)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _selectedText({bool namedFollowing}) {
    final isSelected = namedFollowing == this.followingSelected;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (!isSelected) {
          setState(() {
            this.followingSelected = namedFollowing;
          });
        }
      },
      child: AnimatedDefaultTextStyle(
        duration: kDuration550,
        curve: Sprung.underDamped,
        style: baseStyle.copyWith(
            color:
                isSelected ? Colors.white : Colors.grey[300].withOpacity(0.8),
            fontWeight: FontWeight.w500,
            fontSize: isSelected ? 20 : 18),
        child: Text(
          namedFollowing ? 'Following' : 'For You',
        ),
      ),
    );
  }

  Widget _separator() {
    return Text(
      '|',
      style: TextStyle(
          fontSize: 8,
          color: Colors.grey[300].withOpacity(0.6),
          fontWeight: FontWeight.w600),
    );
  }
}
