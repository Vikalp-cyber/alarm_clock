import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lin/utils/color.dart';

class Timeindicatorpainter extends CustomPainter {
  final DateTime currentTime;

  Timeindicatorpainter(this.currentTime);

  @override
  void paint(Canvas canvas, Size size) {
    double progress = (currentTime.hour * 60 + currentTime.minute) / (24 * 60);

    Paint circlePaint = Paint()
      ..color = MyColors.darkColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Paint progressPaint = Paint()
      ..color = MyColors.greenColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2 - 4;

    canvas.drawCircle(center, radius, circlePaint);

    double sweepAngle = 2 * 3.141592653589793238462643383279502884 * progress;
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -3.141592653589793238462643383279502884 / 2,
        sweepAngle,
        false,
        progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
