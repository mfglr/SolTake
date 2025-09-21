import 'package:flutter/material.dart';

class FailedWidget extends StatelessWidget {
  const FailedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Image.asset(
        "assets/images/failed.png",
        fit: BoxFit.cover,
        height: constraints.constrainHeight(),
        width: constraints.constrainWidth(),
      ),
    );
  }
}