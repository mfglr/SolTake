import 'package:flutter/material.dart';

class LoadingCircleWidget extends StatelessWidget {
  final double? strokeWidth;
  final double? diameter;
  const LoadingCircleWidget({
    super.key,
    this.strokeWidth,
    this.diameter
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: diameter ?? 30,
            width: diameter ?? 30,
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth ?? 4,
            ),
          ),
        ],
      ),
    );
  }
}