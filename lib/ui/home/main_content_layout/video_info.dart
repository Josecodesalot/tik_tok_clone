import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:tik_tok_clone/ui/constants/styles.dart';
import 'package:tik_tok_clone/ui/constants/ui_const.dart';

class VideoInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: width * 0.7,
        padding:
            const EdgeInsets.only(bottom: kBottonNavBarheight + 4, left: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _username(),
            _description(),
            // _songData(),
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
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.library_music),
            Expanded(
              child: Container(
                height: 35,
                child: Marquee(
                  style: baseStyle,
                  text:
                      "Welcome to the junglsadasdfdfasdfsdf asdf asdf adsf asde - Guns n roses - awesome song bruh",
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
        'Wow my video is so cool im in the water,'
        ' cannot believe this is happening to me',
        textAlign: TextAlign.start,
        style: baseStyle,
      ),
    );
  }

  Widget _username() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Text(
        '@username',
        textAlign: TextAlign.start,
        style: baseStyle.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
