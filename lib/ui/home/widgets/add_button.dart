import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tik_tok_clone/ui/constants/ui_const.dart';

class AddButton extends StatelessWidget {
  final space = 6.0;
  final decoration = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.center,
      child: AspectRatio(
        aspectRatio: 8.2 / 5,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: decoration.copyWith(color: kBlue),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              decoration: decoration.copyWith(color: kRed),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: decoration.copyWith(color: Colors.white),
              alignment: Alignment.center,
              child: SizedBox(
                width: 16,
                height: 16,
                child: CustomPaint(
                  painter: _CustomCross(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomCross extends CustomPainter {
  _CustomCross({this.color});

  Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.8;
    canvas.drawLine(
        Offset(size.width / 2, 0), Offset(size.width / 2, size.height), paint);
    canvas.drawLine(
        Offset(0, size.height / 2), Offset(size.width, size.height / 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
