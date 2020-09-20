import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';
import 'package:tik_tok_clone/ui/constants/ui_const.dart';

class TopSwitcher extends StatefulWidget {
  @override
  _TopSwitcherState createState() => _TopSwitcherState();
}

class _TopSwitcherState extends State<TopSwitcher> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
        margin: const EdgeInsets.only(top: 8),
        height: 70,
        alignment: Alignment.topCenter,
        child: Container(
          width: 200,
          child: Stack(
            children: <Widget>[
              Positioned(left: 0, child: _selectedText('Following', true)),
              Align(alignment: Alignment.topCenter, child: _spacer()),
              Positioned(right: 0, child: _selectedText('For You', false)),
            ],
          ),
        ));
  }

  Widget _selectedText(
    String s,
    bool isFollowing,
  ) {
    var isSelected = isFollowing == this.isFollowing;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          if (!isSelected) this.isFollowing = isFollowing;
        });
      },
      child: AnimatedDefaultTextStyle(
          duration: kDuration550,
          curve: Sprung.underDamped,
          style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[300],
              fontWeight: FontWeight.w500,
              fontSize: isSelected ? 17 : 15),
          child: Text(s)),
    );
  }

  Widget _spacer() {
    return Container(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        '|',
        style: TextStyle(
            fontSize: 8, color: Colors.grey[400], fontWeight: FontWeight.w600),
      ),
    );
  }
}
