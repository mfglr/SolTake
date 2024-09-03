import 'package:flutter/material.dart';

class NoNotifications extends StatelessWidget {
  const NoNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Icon(
            Icons.notifications_off,
            size: 50,
          ),
          Text(
            "No Notifications!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40
            ),
          )
        ],
      ),
    );
  }
}