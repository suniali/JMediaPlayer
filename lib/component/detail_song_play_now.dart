import 'package:flutter/material.dart';
import 'package:jmedia_player/component/songs.dart';

class DetailSongPlayNow extends StatefulWidget {
  int positionSong;
  DetailSongPlayNow({this.positionSong});
  @override
  _DetailSongPlayNowState createState() => _DetailSongPlayNowState();
}

class _DetailSongPlayNowState extends State<DetailSongPlayNow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: RichText(textAlign: TextAlign.center,
        text: TextSpan(text: "", children: [
          TextSpan(
            text:
                "${demoPlaylist.songs[widget.positionSong].songTitle}\n",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                height: 1.5,
                letterSpacing: 4.0),
          ),
          TextSpan(
              text: demoPlaylist.songs[widget.positionSong].artist,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.75),
                  letterSpacing: 3.0,
                  fontSize: 12.0,
                  height: 1.5))
        ]),
      ),
    );
  }
}
