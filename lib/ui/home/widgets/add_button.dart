import 'package:flutter/material.dart';
import 'package:tik_tok_clone/ui/constants/styles.dart';

class AddButton extends StatelessWidget {
  final space = 6.0;
  final decoration = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      height: 30,
      alignment: Alignment.center,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: decoration.copyWith(color: Colors.blue),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8),
            decoration: decoration.copyWith(color: Colors.red),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            alignment: Alignment.center,
            decoration: decoration.copyWith(color: Colors.white),
            child: Text(
              '+',
              style: baseStyle.copyWith(fontSize: 24, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
