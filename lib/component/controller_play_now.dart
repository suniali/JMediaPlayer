import 'package:flutter/material.dart';
import 'package:jmedia_player/theme/theme.dart';

class ControllerPlayNow extends StatefulWidget {
  @override
  _ControllerPlayNowState createState() => _ControllerPlayNowState();
}

class _ControllerPlayNowState extends State<ControllerPlayNow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        new PreviousButton(),
        Expanded(
          child: Container(),
        ),
        new PlayPauseButton(),
        Expanded(
          child: Container(),
        ),
        new NextButton(),
        Expanded(
          child: Container(),
        )
      ],
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: lightAccentColor,
      highlightColor: lightAccentColor.withOpacity(0.5),
      iconSize: 50.0,
      color: Colors.white,
      icon: Icon(Icons.skip_next),
      onPressed: () {},
    );
  }
}

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        fillColor: Colors.white,
        shape: CircleBorder(),
        elevation: 10.0,
        splashColor: lightAccentColor,
        highlightColor: lightAccentColor.withOpacity(0.5),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(
            Icons.play_arrow,
            color: darkAccentColor,
            size: 50.0,
          ),
        ),
        onPressed: () {
          //TODO:
        });
  }
}

class PreviousButton extends StatelessWidget {
  const PreviousButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: lightAccentColor,
      highlightColor: lightAccentColor.withOpacity(0.5),
      color: Colors.white,
      icon: Icon(Icons.skip_previous),
      iconSize: 50.0,
      onPressed: () {},
    );
  }
}
