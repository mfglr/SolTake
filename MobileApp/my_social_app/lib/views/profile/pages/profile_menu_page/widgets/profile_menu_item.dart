import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color? nameColor;
  final Color? iconColor;
  final void Function() onPressed;
  final bool displayRightArrow;
  const ProfileMenuItem({
    super.key,
    required this.name,
    required this.icon,
    required this.onPressed,
    this.iconColor,
    this.nameColor,
    this.displayRightArrow = true
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: Icon(
                    icon,
                    color: iconColor,
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: nameColor
                  ),
                ),
              ],
            ),
            if(displayRightArrow)
              const Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }
}