import 'package:flutter/material.dart';

class CirclerProgressWidget extends StatelessWidget {
  final double rate;
  final Color progressColor;
  const CirclerProgressWidget({
    super.key,
    required this.rate,
    this.progressColor = Colors.green
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 5,
      backgroundColor: Colors.blue,
      valueColor: AlwaysStoppedAnimation<Color>(progressColor),
      value: rate,
    );
  }
}