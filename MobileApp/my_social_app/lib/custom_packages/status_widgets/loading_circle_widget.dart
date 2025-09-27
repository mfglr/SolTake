import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/status_widgets/loading_widget.dart';

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
    final t = diameter ?? 30;
    return SizedBox(
      height: t,
      width: t,
      child: LoadingWidget(
        borderRadius: t / 2,
      )
    );
  }
}