import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';

class NoFollows extends StatelessWidget {
  final UserState user;
  final String message;
  const NoFollows({
    super.key,
    required this.user,
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_off_outlined,
              size: 45,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: const TextStyle(
                fontSize: 45,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}