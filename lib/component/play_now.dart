import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:jmedia_player/component/controller_play_now.dart';

class PlayNow extends StatefulWidget {
  @override
  _PlayNowState createState() => _PlayNowState();
}

class _PlayNowState extends State<PlayNow> {
  final AudioPlayer player=AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Stack(
          children: <Widget>[
            //Image.asset(""),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //seekbar
                   //SeekBar(),
                //virtualizer
                Container(
                  width: double.infinity,
                  height: 125.0,
                ),

                //song title,artist name,and controls
                ControllerPlayNow(jPlayer: player,),
              ],
            )
          ],
        );
  }
}