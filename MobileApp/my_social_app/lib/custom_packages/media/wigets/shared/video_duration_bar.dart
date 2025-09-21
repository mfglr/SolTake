import 'package:flutter/material.dart';

class VideoDurationBar extends StatelessWidget {
  final double rate;
  const VideoDurationBar({
    super.key,
    required this.rate
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        height: 3,
        width: constraints.constrainWidth() * rate,
        color: Colors.black,
      ),
    );
  }
}