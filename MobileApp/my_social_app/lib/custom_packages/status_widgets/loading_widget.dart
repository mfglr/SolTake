import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  static final _baseColor = Colors.grey.shade300;
  static final _highlightColor = Colors.grey.shade100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Shimmer.fromColors(
        baseColor: _baseColor,
        highlightColor: _highlightColor,
        child: Container(
          height: constraints.constrainHeight(),
          width: constraints.constrainWidth(),
          decoration: BoxDecoration(
            color: _baseColor,
          ),
        )
      ),
    );
  }
}