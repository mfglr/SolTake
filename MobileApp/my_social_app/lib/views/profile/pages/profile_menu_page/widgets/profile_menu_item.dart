import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final void Function() onPressed;
  const ProfileMenuItem({
    super.key,
    required this.name,
    required this.icon,
    required this.onPressed
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
                Icon(icon),
                Text(name),
              ],
            ),
            const Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }
}