import 'package:flutter/material.dart';

class CustomLinearProgressIndicator extends CustomPainter {
  final double percent;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4.0 
      ..style = PaintingStyle.stroke;

    final double borderLength = size.width * percent;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(borderLength, 0);

    canvas.drawPath(path, paint);
  }

  const CustomLinearProgressIndicator({required this.percent});

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}