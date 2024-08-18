import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';

class UserTaggedInCommentItem extends StatelessWidget {
  final NotificationState notification;
  const UserTaggedInCommentItem({super.key,required this.notification});
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,CommentState?>(
      onInit: (store) => store.dispatch(LoadCommentAction(commentId: notification.commentId!)),
      converter: (store) => store.state.commentEntityState.entities[notification.commentId!],
      builder: (context,comment) => NotificationItem(
        notification: notification,
        content: "You have been tagged in a comment.",
        icon: const Icon(
          Icons.tag,
          color: Colors.black,
        ),
        onPressed: (){

        }
      ),
    );
  }
}