import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:jmedia_player/component/songs.dart';
import 'package:jmedia_player/theme/theme.dart';

class ControllerPlayNow extends StatefulWidget {
  AudioPlayer player = AudioPlayer();
  @override
  _ControllerPlayNowState createState() => _ControllerPlayNowState();
}

class _ControllerPlayNowState extends State<ControllerPlayNow> {
  bool isProccessing = false;
  Future<void> play() async {
    setState(() {
      isProccessing = true;
    });
    if (widget.player.state == AudioPlayerState.STOPPED ||
        widget.player.state == AudioPlayerState.PAUSED) {
      await widget.player.play(demoPlaylist.songs[0].audioUrl);
      setState(() {
        isProccessing = false;
      });
    } else if (widget.player.state == AudioPlayerState.PLAYING) {
      setState(() {
        isProccessing = true;
      });
      await widget.player.pause();
      setState(() {
        isProccessing = false;
      });
    }
  }

  Future<void> stop() async {
    await widget.player.stop();
    setState(() {});
  }

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
        new PlayPauseButton(() => play(), isProccessing, widget.player.state),
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

  static AudioPlayer() {}
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
  final Function onPressed;
  bool isProccessing;
  final AudioPlayerState statePlayer;
  PlayPauseButton(this.onPressed, this.isProccessing, this.statePlayer);

  @override
  Widget build(BuildContext context) {
    if (!isProccessing) {
      if (statePlayer == AudioPlayerState.PAUSED ||
          statePlayer == AudioPlayerState.STOPPED ||
          statePlayer == AudioPlayerState.COMPLETED) {
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
            onPressed: onPressed);
      } else {
        return RawMaterialButton(
            fillColor: Colors.white,
            shape: CircleBorder(),
            elevation: 10.0,
            splashColor: lightAccentColor,
            highlightColor: lightAccentColor.withOpacity(0.5),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.pause,
                color: darkAccentColor,
                size: 50.0,
              ),
            ),
            onPressed: onPressed);
      }
    } else {
      return RawMaterialButton(
          fillColor: Colors.white,
          shape: CircleBorder(),
          elevation: 10.0,
          splashColor: lightAccentColor,
          highlightColor: lightAccentColor.withOpacity(0.5),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SizedBox(height: 50.0,width: 50.0, child:CircularProgressIndicator(),)
          ),
          onPressed: onPressed);
    }
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
