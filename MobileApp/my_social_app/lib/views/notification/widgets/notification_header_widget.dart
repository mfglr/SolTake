import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';

class NotificationHeaderWidget extends StatelessWidget {
  final UserState user;
  final NotificationState notification;
  final String message;

  const NotificationHeaderWidget({
    super.key,
    required this.user,
    required this.notification,
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        TextButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(userId: notification.userId!))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: UserImageWidget(
                  userId: user.id,
                  diameter: 45
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: Text(user.userName)
              ),
            ],
          ),
        ),
        Text(message)
      ],
    );
  }
}