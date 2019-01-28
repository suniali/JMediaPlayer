import 'package:flutter/material.dart';
import 'package:jmedia_player/component/controller_play_now.dart';
import 'package:jmedia_player/component/detail_song_play_now.dart';
import 'package:jmedia_player/theme/theme.dart';

class FooterPlayNow extends StatefulWidget {
  @override
  _FooterPlayNowState createState() => _FooterPlayNowState();
}

class _FooterPlayNowState extends State<FooterPlayNow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Material(
        color: accentColor,
         shadowColor: Color(0x44000000),
              child: Padding(
           padding: const EdgeInsets.only(top: 40.0, bottom: 50.0), 
          child: Column(
            children: <Widget>[
              DetailSongPlayNow(),
              ControllerPlayNow(),
            ],
          ),
        ),
      ),
    );
  }
}
