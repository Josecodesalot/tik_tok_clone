import 'package:flutter/material.dart';
import 'package:tik_tok_clone/ui/constants/stules.dart';
import 'package:tik_tok_clone/ui/home/widgets/add_button.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 75,
        color: Colors.black,
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
