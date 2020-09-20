import 'package:flutter/material.dart';
import 'package:tik_tok_clone/ui/constants/stules.dart';

class AddButton extends StatelessWidget {
  final space = 6.0;
  final decoration = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      alignment: Alignment.center,
      child: SizedBox(
        height: 35,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 4),
              decoration: decoration.copyWith(color: Colors.blue),
            ),
            Container(
              margin: const EdgeInsets.only(left: 4),
              decoration: decoration.copyWith(color: Colors.red),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              alignment: Alignment.center,
              decoration: decoration.copyWith(color: Colors.black),
              child: Text(
                '+',
                style: baseStyle.copyWith(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
