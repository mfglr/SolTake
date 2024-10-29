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
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.elliptical(5, 5))
              ),
            )
          ],
        ),
      ),
    );
  }
}