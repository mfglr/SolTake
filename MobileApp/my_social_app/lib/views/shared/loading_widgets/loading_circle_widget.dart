import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCircleWidget extends StatelessWidget {
  final double diameter;
  final Color baseColor;
  final Color highlightColor;

  const LoadingCircleWidget({
    super.key,
    required this.diameter,
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5)
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        height: diameter,
        width: diameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: baseColor,
        ),
      ),
    );
  }
}