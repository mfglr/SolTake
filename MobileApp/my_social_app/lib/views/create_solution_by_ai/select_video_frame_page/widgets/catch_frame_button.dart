import 'package:flutter/material.dart';

class CatchFrameButton extends StatelessWidget {
  final void Function() onPressed;
  const CatchFrameButton({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(128),
        borderRadius: const BorderRadius.all(Radius.circular(8))
      ),
      child: TextButton(
        onPressed: onPressed,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Catch Frame",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
            ),
            Icon(
              Icons.crop,
              color: Colors.white,
              size: 25,
            )
          ],
        )
      ),
    );
  }
}