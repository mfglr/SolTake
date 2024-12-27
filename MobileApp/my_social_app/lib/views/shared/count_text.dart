import 'package:flutter/material.dart';

class CountText extends StatelessWidget {
  final int count;
  const CountText({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      count.toString(),
      style: const TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 15,
        color: Colors.white
      ),
    );
  }
}