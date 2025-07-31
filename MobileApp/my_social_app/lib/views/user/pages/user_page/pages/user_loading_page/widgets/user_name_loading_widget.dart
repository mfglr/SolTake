import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserNameLoadingWidget extends StatelessWidget {
  const UserNameLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: 85,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.all(Radius.circular(5))
        ),
        child: const Text(""),
      ),
    );
  }
}