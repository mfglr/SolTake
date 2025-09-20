import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Image.asset(
        "assets/images/notFound.png",
        fit: BoxFit.cover,
        height: constraints.constrainHeight(),
        width: constraints.constrainWidth(),
      ),
    );
  }
}