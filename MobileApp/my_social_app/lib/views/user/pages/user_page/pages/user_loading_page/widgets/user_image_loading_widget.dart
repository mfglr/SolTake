import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserImageLoadingWidget extends StatelessWidget {
  const UserImageLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}