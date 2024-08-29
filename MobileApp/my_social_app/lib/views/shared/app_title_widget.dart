import 'package:flutter/material.dart';

class AppTitleWidget extends StatelessWidget {
  final String title;
  const AppTitleWidget({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
    );
  }
}