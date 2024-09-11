import 'package:flutter/material.dart';

class CirclePaginationItemWidget extends StatelessWidget {
  final double diameter;
  final bool isActive;
  final Color activeColor;
  final Color passiveColor;
  final int index;
  final void Function(int) changeActiveIndex;

  const CirclePaginationItemWidget({
    super.key,
    required this.diameter,
    required this.isActive,
    required this.activeColor,
    required this.passiveColor,
    required this.index,
    required this.changeActiveIndex
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => changeActiveIndex(index),
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: Container(
        height: diameter,
        width: diameter,
        decoration: BoxDecoration(
          color: isActive ? activeColor : passiveColor,
          shape: BoxShape.circle,
        ),
      )
    );
  }
}