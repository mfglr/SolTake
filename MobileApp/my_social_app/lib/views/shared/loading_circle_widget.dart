import 'package:flutter/material.dart';

class LoadingCircleWidget extends StatelessWidget {
  final double? strokeWidth;
  const LoadingCircleWidget({super.key,this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            strokeWidth: strokeWidth ?? 4,
          ),
        ],
      ),
    );
  }
}