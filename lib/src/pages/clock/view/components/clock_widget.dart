import 'dart:math';
import 'package:flutter/material.dart';

import '../../../../models/date_time.dart';

class ClockView extends StatefulWidget {
  const ClockView({super.key, required this.time});
  final CurrentDataTime time;
  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
          color: Color.fromARGB(223, 26, 238, 114),
          blurRadius: 38.0,
        )
      ]),
      height: 300,
      width: 300,
      child: CustomPaint(
        painter:
            ClockPainter(widget.time.hour, widget.time.min, widget.time.sec),
      ),
    );
  }
}
// creating the Clock Painter Class

class ClockPainter extends CustomPainter {
  int? seconds;
  int? minutes;
  int? hours;
  ClockPainter(this.hours, this.minutes, this.seconds);

  @override
  void paint(Canvas canvas, Size size) {
    List<int> hoursToDraw = [1, 2, 4, 5, 7, 8, 10, 11];
  
    double secRad = ((pi / 2) - (pi / 30) * this.seconds!) % (2 * pi);
    double minRad = ((pi / 2) - (pi / 30) * this.minutes!) % (2 * pi);
    double hourRad = ((pi / 2) - (pi / 6) * this.hours!) % (2 * pi);

    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var secHeight = radius / 2;
    var minHeight = radius / 2 - 10;
    var hoursHeight = radius / 2 - 25;

    var seconds = Offset(
        centerX + secHeight * cos(secRad), centerY - secHeight * sin(secRad));
    var minutes = Offset(
        centerX + cos(minRad) * minHeight, centerY - sin(minRad) * minHeight);
    var hours = Offset(centerX + cos(hourRad) * hoursHeight,
        centerY - sin(hourRad) * hoursHeight);

    // Setting the Fillbrush paint
    var fillBrush = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round;

    var centerDotBrush = Paint()..color = const Color(0xFFEAECFF);

    /* Setting the hands brush */

    var secHandBrush = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2
      ..strokeJoin = StrokeJoin.round;

    var minHandBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3
      ..strokeJoin = StrokeJoin.round;

    var hourHandBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5
      ..strokeJoin = StrokeJoin.round;

    var dot12h = Offset(centerX, centerY - radius + 50);
    var dot3h = Offset(centerX + radius - 50, centerY);
    var dot6h = Offset(centerX, centerY + radius - 50);
    var dot9h = Offset(centerX - radius + 50, centerY);

    canvas.drawCircle(center, radius - 40, fillBrush);

    canvas.drawCircle(dot12h, 5, centerDotBrush);
    canvas.drawCircle(dot3h, 5, centerDotBrush);
    canvas.drawCircle(dot6h, 5, centerDotBrush);
    canvas.drawCircle(dot9h, 5, centerDotBrush);


    double dotRadius = 3;

    for (int hour in hoursToDraw) {
      double hourRad = ((pi / 2) - (pi / 6) * hour) % (2 * pi);

      var dotPosition = Offset(
        centerX + cos(hourRad) * (radius - 50),
        centerY - sin(hourRad) * (radius - 50),
      );
      canvas.drawCircle(dotPosition, dotRadius, centerDotBrush);
    }

    canvas.drawLine(center, seconds, secHandBrush);
    canvas.drawLine(center, minutes, minHandBrush);
    canvas.drawLine(center, hours, hourHandBrush);
    canvas.drawCircle(center, 10, centerDotBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
