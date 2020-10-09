import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tik_tok_clone/model/tik_tok.dart';
import 'package:tik_tok_clone/ui/constants/ui_const.dart';
import 'package:tik_tok_clone/ui/widgets/rotate.dart';

class SideActions extends StatelessWidget {
  final TikTok tikTok;

  SideActions(this.tikTok);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Spacer(),
          _profileButton(),
          _sideButton(icon: Icons.favorite, value: tikTok.likes),
          _sideButton(icon: Icons.comment, value: tikTok.comments),
          _sideButton(icon: Icons.share, value: tikTok.shares),
          SizedBox(height: 12),
          _spinningDisk(),
          SizedBox(
            height: kBottonNavBarheight + 8,
          )
        ],
      ),
    );
  }

  Widget _spinningDisk() {
    return Container(
      height: 50,
      width: 50,
      child: Rotate(
        duration: Duration(milliseconds: 4500),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: kRoundDecoration.copyWith(
              color: Colors.grey,
              gradient: LinearGradient(colors: [
                Colors.black,
                Colors.black,
                Colors.grey,
                Colors.black,
                Colors.black,
              ])),
          child: Container(
            decoration: kRoundDecoration.copyWith(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  tikTok.user.imgUrl,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _sideButton({IconData icon, int value}) {
    return Opacity(
      opacity: 0.7,
      child: Column(
        children: <Widget>[
          Icon(
            icon ?? Icons.message,
            color: Colors.white,
            size: 40,
          ),
          Text(
            '$value',
            style: baseStyle.copyWith(fontSize: 12),
          ),
          const SizedBox(
            height: 18,
          ),
        ],
      ),
    );
  }

  _profileButton() {
    return Container(
      height: 72,
      width: 56,
      margin: const EdgeInsets.only(bottom: 24),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: kRoundDecoration.copyWith(
                border: Border.all(color: Colors.white, width: 1.5),
                color: Colors.black,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(tikTok.user.imgUrl))),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 18,
              width: 18,
              padding: EdgeInsets.all(5),
              decoration: kRoundDecoration.copyWith(
                color: kRedAccent,
              ),
              child: CustomPaint(
                painter: _PlusPainter(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _PlusPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final top = Offset(size.width / 2, 0);
    final bottom = Offset(size.width / 2, size.height);

    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.25;

    canvas.drawLine(top, bottom, paint);
    canvas.drawLine(
        Offset(0, size.height / 2), Offset(size.width, size.height / 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
