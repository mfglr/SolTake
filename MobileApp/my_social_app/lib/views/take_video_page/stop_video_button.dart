import 'package:flutter/material.dart';

class StopVideoButton extends StatelessWidget {
  const StopVideoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
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