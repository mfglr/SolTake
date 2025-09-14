import 'package:flutter/material.dart';

class LinearProgressBar extends StatelessWidget {
  final double rate;
  const LinearProgressBar({
    super.key,
    required this.rate
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      color: Colors.black.withAlpha(128),
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: 4,
          width: rate * constraints.constrainWidth(),
          color: Colors.blue,
        )
      ),
    );
  }
}