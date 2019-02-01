import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:jmedia_player/component/controller_play_now.dart';
import 'package:jmedia_player/component/songs.dart';

class PlayNow extends StatefulWidget {
  int positionPlayer = 0;
  @override
  _PlayNowState createState() => _PlayNowState();
}

class _PlayNowState extends State<PlayNow> {
  final AudioPlayer player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.network(
          demoPlaylist.songs[widget.positionPlayer].albumArtUrl,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          color: Colors.black87,
          colorBlendMode: BlendMode.darken,
        ),
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
            ControllerPlayNow(jPlayer: player),
          ],
        )
      ],
    );
  }
}
