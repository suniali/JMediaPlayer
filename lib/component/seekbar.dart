import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jmedia_player/component/circle_clipper.dart';
import 'package:jmedia_player/component/packages/radial_drag_gesture_detector.dart';
import 'package:jmedia_player/component/redial_seekbar.dart';
import 'package:jmedia_player/component/songs.dart';
import 'package:jmedia_player/theme/theme.dart';

class SeekBar extends StatefulWidget {
  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double _seekPersent = 0.0;
  PolarCoord _startDragCoord;
  double _startDragPersent;
  double _currentDragPersent;

  void _onDragStart(PolarCoord coord) {
    _startDragCoord = coord;
    _startDragPersent = _seekPersent;
  }

  void _onUpdateStart(PolarCoord coord) {
    final dragAngle = coord.angle - _startDragCoord.angle;
    final dragPercent = dragAngle / (2 * pi);

    setState(() => _currentDragPersent = (_startDragPersent + dragPercent) % 1.0);
  }

  void _onEndDragStart() {
    _seekPersent=_currentDragPersent;
    _startDragPersent=0.0;
    _startDragCoord=null;
    _currentDragPersent=null;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadialDragGestureDetector(
        onRadialDragStart: _onDragStart,
        onRadialDragUpdate: _onUpdateStart,
        onRadialDragEnd: _onEndDragStart,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.transparent,
          child: Center(
              child: Container(
            width: 140.0,
            height: 140.0,
            child: RedialSeekBar(
              progressPrecent: _seekPersent,
              thumbPosition: _seekPersent,
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
        ),
      ),
    );
  }
}
