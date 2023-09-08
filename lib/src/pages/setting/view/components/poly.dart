import 'dart:math';

import 'package:flutter/material.dart';

class Poly extends StatelessWidget {
  const Poly({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: RegularPolygonPainter(
            paints: Paint()
              ..color = Colors.blue
              ..strokeCap = StrokeCap.round,
            radius: 50,
            sides: 7));
  }
}

class RegularPolygonPainter extends CustomPainter {
  final int sides;
  final double radius;
  final Paint paints;

  RegularPolygonPainter(
      {required this.sides, required this.radius, required this.paints});

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double angleStep = 2 * pi / sides;

    final List<Offset> vertices = [];

    for (int i = 0; i < sides; i++) {
      final double x = centerX + radius * cos(i * angleStep);
      final double y = centerY + radius * sin(i * angleStep);
      vertices.add(Offset(x, y));
    }

    final Path path = Path()..addPolygon(vertices, true);

    canvas.drawPath(path, paints);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
