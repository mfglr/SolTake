import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoaingRectangleWidget extends StatelessWidget {
  final Color baseColor;
  final Color highlightColor;
  
  const LoaingRectangleWidget({
    super.key,
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5)
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Container(
          height: constraints.constrainHeight(),
          width: constraints.constrainWidth(),
          decoration: BoxDecoration(
            color: baseColor,
          ),
        ),
      ),
    );
  }
}