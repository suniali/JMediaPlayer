import 'package:flutter/material.dart';
import 'package:jmedia_player/component/circle_clipper.dart';
import 'package:jmedia_player/component/redial_seekbar.dart';
import 'package:jmedia_player/component/songs.dart';
import 'package:jmedia_player/theme/theme.dart';

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
        width: 140.0,
        height: 140.0,
        child: RedialSeekBar(
          progressPrecent: 0.25,
          thumbPosition: 0.25,
          trackColor: Color(0xFFDDDDDD),
          insidePadding: EdgeInsets.all(10.0),
          progressColor: accentColor,
          thumbColor: lightAccentColor,
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
