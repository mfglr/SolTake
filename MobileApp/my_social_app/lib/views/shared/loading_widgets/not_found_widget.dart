import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget {
  final BoxFit fit;
  const NotFoundWidget({
    super.key,
    this.fit = BoxFit.cover
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Image.asset(
        "assets/images/notFound.png",
        fit: fit,
        height: constraints.constrainHeight(),
        width: constraints.constrainWidth(),
      ),
    );
  }
}