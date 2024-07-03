import 'package:flutter/material.dart';

class UserImageLoadingView extends StatelessWidget {
  final double diameter;
  const UserImageLoadingView(this.diameter,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle
      ),
      child: const CircularProgressIndicator(),
    );
  }
}