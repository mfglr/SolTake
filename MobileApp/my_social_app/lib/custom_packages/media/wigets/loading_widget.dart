import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: constraints.constrainHeight(),
          width: constraints.constrainWidth(),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
          ),
        )
      ),
    );
  }
}