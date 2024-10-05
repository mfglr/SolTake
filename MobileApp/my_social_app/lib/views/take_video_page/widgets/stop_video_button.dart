import 'package:flutter/material.dart';

class StopVideoButton extends StatelessWidget {
  final void Function() onPressed;
  const StopVideoButton({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: Colors.white,
      onPressed: onPressed,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}