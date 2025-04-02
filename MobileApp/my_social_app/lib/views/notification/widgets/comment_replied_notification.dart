import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_bottom_text_content.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CommentRepliedNotification extends StatelessWidget {
  final NotificationState notification;
  const CommentRepliedNotification({
    super.key,
    required this.notification
  });

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      content: AppLocalizations.of(context)!.comment_replied_notification_content,
      icon: const Icon(
        Icons.reply,
        color: Colors.green,
      ),
      // bottomContent: NotificationBottomTextContent(content: notification.commentContent ?? ""),
      onPressed: () => {}
    );
  }
}