import 'package:flutter/material.dart';

class LoadWidget extends StatelessWidget {
  final double borderRadius;
  const LoadWidget({
    super.key,
    this.borderRadius = 0
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        height: constraints.constrainHeight(),
        width: constraints.constrainWidth(),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      )
    );
  }
}