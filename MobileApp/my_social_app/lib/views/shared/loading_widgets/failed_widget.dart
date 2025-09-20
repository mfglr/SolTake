import 'package:flutter/material.dart';

class FailedWidget extends StatelessWidget {
  final BoxFit fit;
  const FailedWidget({
    super.key,
    this.fit = BoxFit.cover
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Image.asset(
        "assets/images/failed.png",
        fit: fit,
        height: constraints.constrainHeight(),
        width: constraints.constrainWidth(),
      ),
    );
  }
}