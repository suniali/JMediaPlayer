import 'package:flutter/material.dart';
import 'package:jmedia_player/component/circle_clipper.dart';
import 'package:jmedia_player/component/redial_seekbar.dart';
import 'package:jmedia_player/component/songs.dart';

class SeekBar extends StatefulWidget {
  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
          child: Container(
        width: 125.0,
        height: 125.0,
        child: RedialSeekBar(
          child: ClipOval(
            clipper: CircleClipper(),
            child: Image.network(
              demoPlaylist.songs[1].albumArtUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      )),
    );
  }
}
