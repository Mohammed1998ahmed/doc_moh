import 'dart:math';
import 'package:flutter/material.dart';

class HexagonLine extends StatelessWidget {
  final double size;
  final Color lineColor;

  HexagonLine({required this.size, required this.lineColor});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _HexagonPainter(lineColor),
    );
  }
}

class _HexagonPainter extends CustomPainter {
  final Color lineColor;

  _HexagonPainter(this.lineColor);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = size.width / 2;

    path.moveTo(centerX + radius * cos(0), centerY + radius * sin(0));

    for (var i = 1; i <= 6; i++) {
      final angle = 2.0 * pi * i / 6;
      final x = centerX + radius * cos(angle);
      final y = centerY + radius * sin(angle);
      path.lineTo(x, y);
    }

    path.close();

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = lineColor
      ..strokeWidth = 2.0;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
