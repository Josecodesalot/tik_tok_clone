import 'package:flutter/material.dart';
import 'package:tik_tok_clone/ui/constants/stules.dart';
import 'package:tik_tok_clone/ui/home/widgets/add_button.dart';

class BottomNavigation extends StatelessWidget {
  final bottomNavHeight;

  BottomNavigation(this.bottomNavHeight);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: bottomNavHeight,
        decoration: BoxDecoration(
            color: Colors.black,
            border: Border(top: BorderSide(color: Colors.white, width: .5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: _item('Home'),
            ),
            Expanded(
              child: _item('Discover'),
            ),
            Expanded(
              child: AddButton(),
            ),
            Expanded(
              child: _item('Inbox'),
            ),
            Expanded(
              child: _item('Me'),
            ),
          ],
        ),
      ),
    );
  }

  _item(String title, {IconData icon}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon ?? Icons.home,
          color: Colors.white,
          size: 25,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "something",
          style: baseStyle.copyWith(fontSize: 8, color: Colors.white),
        )
      ],
    );
  }
}
