import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marquee/marquee.dart';
import 'package:tik_tok_clone/model/tik_tok.dart';
import 'package:tik_tok_clone/ui/constants/styles.dart';
import 'package:tik_tok_clone/ui/constants/ui_const.dart';

class VideoInfo extends StatelessWidget {
  final TikTok tikTok;

  VideoInfo(this.tikTok);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: width * 0.7,
        //bottom nav bar + padding (e=4y32)
        padding: const EdgeInsets.only(bottom: kBottonNavBarheight, left: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _username(),
            _description(),
            _songData(),
          ],
        ),
      ),
    );
  }

  Widget _songData() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 35,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.itunesNote,
              color: Colors.white,
              size: 17,
            ),
            SizedBox(
              width: 6,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  height: 15,
                  alignment: Alignment.center,
                  child: Marquee(
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      blankSpace: 16.0,
                      velocity: 24.0,
                      startPadding: 10.0,
                      style: baseStyle,
                      text: tikTok.song.name),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _description() {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(bottom: 12),
      child: Text(
        '${tikTok.description}',
        maxLines: 3,
        textAlign: TextAlign.start,
        style: baseStyle,
      ),
    );
  }

  Widget _username() {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Text(
        '@${tikTok.user.handle}',
        textAlign: TextAlign.start,
        style: baseStyle.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
