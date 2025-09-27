import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/status_widgets/load_widget.dart';

class LoadCircleWidget extends StatelessWidget {
  final double? diameter;
  const LoadCircleWidget({
    super.key,
    required this.diameter
  });

  @override
  Widget build(BuildContext context) {
    final t = diameter ?? 30;
    return SizedBox(
      height: t,
      width: t,
      child: LoadWidget(
        borderRadius: t / 2,
      )
    );
  }
}