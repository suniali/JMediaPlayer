import 'package:flutter/material.dart';

class DetailSongPlayNow extends StatefulWidget {
  @override
  _DetailSongPlayNowState createState() => _DetailSongPlayNowState();
}

class _DetailSongPlayNowState extends State<DetailSongPlayNow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: RichText(
        text: TextSpan(text: "", children: [
          TextSpan(
            text: "song title\n",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                height: 1.5,
                letterSpacing: 4.0),
          ),
          TextSpan(
              text: "Artists Name",
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
