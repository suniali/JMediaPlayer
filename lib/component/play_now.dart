import 'package:flutter/material.dart';
import 'package:jmedia_player/component/footer_play_now.dart';
import 'package:jmedia_player/component/seekbar.dart';
import 'package:jmedia_player/theme/theme.dart';

class PlayNow extends StatefulWidget {
  @override
  _PlayNowState createState() => _PlayNowState();
}

class _PlayNowState extends State<PlayNow> {
  @override
  Widget build(BuildContext context) {
    return Stack(
          children: <Widget>[
            //Image.asset(""),
            Column(
              children: <Widget>[
                //seekbar
                SeekBar(),
                //virtualizer
                Container(
                  width: double.infinity,
                  height: 125.0,
                ),

                //song title,artist name,and controls
                FooterPlayNow(),
              ],
            )
          ],
        );
  }
}