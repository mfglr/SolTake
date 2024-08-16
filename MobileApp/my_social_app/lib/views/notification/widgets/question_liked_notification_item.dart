import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_header_widget.dart';
import 'package:my_social_app/views/question/pages/display_question_page.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NotificationHeaderWidget(
                    user: user,
                    notification: notification,
                    message: "like your question."
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: OutlinedButton(
                          onPressed: () => 
                            Navigator
                              .of(context)
                              .push(MaterialPageRoute(builder: (context) => DisplayQuestionPage(questionId: notification.questionId!))),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                child: const Text("Go to question"),
                              ),
                              const Icon(Icons.arrow_forward)
                            ],
                          )
                        ),
                      ),
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