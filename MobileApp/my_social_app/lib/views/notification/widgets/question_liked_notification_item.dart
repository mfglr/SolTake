import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/loading_widget.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class QuestionLikedNotificationItem extends StatelessWidget {
  final NotificationState notification;
  const QuestionLikedNotificationItem({super.key,required this.notification});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserState?>(
      onInit: (store) => store.dispatch(LoadUserAction(userId: notification.userId!)),
      converter: (store) => store.state.userEntityState.entities[notification.userId!],
      builder: (context,user){
        if(user != null){
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: UserImageWidget(
                          userId: user.id,
                          diameter: 45
                        ),
                      ),
                      Expanded(
                        child: Text("${user.userName} like your question."),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:15,left: 5),
                        child: Text(
                          timeago.format(notification.createdAt,locale: 'en_short')
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
        return const LoadingWidget();
      },
    );
  }
}