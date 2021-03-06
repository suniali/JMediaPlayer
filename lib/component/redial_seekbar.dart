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
  final EdgeInsets outerPadding;
  final EdgeInsets insidePadding;
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
    this.outerPadding=const EdgeInsets.all(0.0),
    this.insidePadding=const EdgeInsets.all(0.0),
    this.child,
  });

  @override
  _RedialSeekBarState createState() => _RedialSeekBarState();
}

class _RedialSeekBarState extends State<RedialSeekBar> {

  EdgeInsets _insetsForPadding()
  {
    //make room for the painted track,progress,and thumb.We devided by 2.0
    //Beacause we want to allow flush painting  against the track , so we only need
    //to acount the thickness out side the track ,not inside
    final outerThickness=max(
      widget.trackWidth, max(widget.progressWidth, widget.thumbWidth))/2;
      return EdgeInsets.all(outerThickness);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: RadialSeekBarPainter(
          trackWidth: widget.trackWidth,
          trackColor: widget.trackColor,
          progressWidth: widget.progressWidth,
          progressColor: widget.progressColor,
          progressPrecent: widget.progressPrecent,
          thumbWidth: widget.thumbWidth,
          thumbColor: widget.thumbColor,
          thumbPosition: widget.thumbPosition),
      child: Padding(
        padding:_insetsForPadding()+widget.insidePadding,
        child: widget.child,
      ),
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
          ..strokeCap = StrokeCap.round
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
    final outerThickness = max(trackWidth, max(progressWidth, thumbWidth));
    final Size constraintSize =
        Size(size.width - outerThickness, size.height - outerThickness);

    final center = Offset(size.width / 2, size.height / 2);
    final rasius = min(constraintSize.width, constraintSize.height) / 2;
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

    //Paint thumb
    final thumbAngle = 2 * pi * thumbPosition - (pi / 2);
    final thumbX = cos(thumbAngle) * rasius;
    final thumbY = sin(thumbAngle) * rasius;
    final thumbCenter = Offset(thumbX, thumbY) + center;
    final thumbRadius = thumbWidth / 2;
    canvas.drawCircle(thumbCenter, thumbRadius, thumbPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
