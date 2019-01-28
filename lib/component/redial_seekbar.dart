import 'dart:math';

import 'package:flutter/material.dart';

class RedialSeekBar extends StatefulWidget {
  final double trackWidth;
  final Color trackColor;
  final double progressWidth;
  final Color progressColor;
  final double progressPrecent;
  final double thumbWidth;
  final Color thumbColor;
  final double thumbPosition;
  final Widget child;

  RedialSeekBar({
    this.trackWidth = 3.0,
    this.trackColor = Colors.grey,
    this.progressWidth = 5.0,
    this.progressColor = Colors.black,
    this.progressPrecent = 0.0,
    this.thumbWidth = 10.0,
    this.thumbColor = Colors.black,
    this.thumbPosition = 0.0,
    this.child,
  });

  @override
  _RedialSeekBarState createState() => _RedialSeekBarState();
}

class _RedialSeekBarState extends State<RedialSeekBar> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RadialSeekBarPainter(
          trackWidth: widget.trackWidth,
          trackColor: widget.trackColor,
          progressWidth: widget.progressWidth,
          progressColor: widget.progressColor,
          progressPrecent: widget.progressPrecent,
          thumbWidth: widget.thumbWidth,
          thumbColor: widget.thumbColor,
          thumbPosition: widget.thumbPosition),
      child: widget.child,
    );
  }
}

class RadialSeekBarPainter extends CustomPainter {
  final double trackWidth;
  final Paint trackPaint;
  final double progressWidth;
  final double progressPrecent;
  final Paint progressPaint;
  final double thumbWidth;
  final double thumbPosition;
  final Paint thumbPaint;

  RadialSeekBarPainter({
    @required this.trackWidth,
    @required trackColor,
    @required this.progressWidth,
    @required progressColor,
    @required this.progressPrecent,
    @required this.thumbWidth,
    @required thumbColor,
    @required this.thumbPosition,
  })  : trackPaint = Paint()
          ..color = trackColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = trackWidth,
        progressPaint = Paint()
          ..color = progressColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = progressWidth
          ..strokeCap = StrokeCap.round,
        thumbPaint = Paint()
          ..color = thumbColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = thumbWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final rasius = min(size.width, size.height) / 2;
    // Paint track
    canvas.drawCircle(
        //center
        center,
        //radius
        rasius,
        //paint
        trackPaint);

    //Paint Progressbar
    final progressAngle = pi * 2 * progressPrecent;
    canvas.drawArc(Rect.fromCircle(center: center, radius: rasius), -pi / 2,
        progressAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
