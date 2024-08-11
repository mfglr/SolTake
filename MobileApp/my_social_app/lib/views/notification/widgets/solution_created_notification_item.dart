import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/solution/pages/display_solution_page.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class SolutionCreatedNotificationItem extends StatelessWidget {
  final NotificationState notification;
  const SolutionCreatedNotificationItem({super.key,required this.notification});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserState?>(
      onInit: (store) => store.dispatch(LoadUserAction(userId: notification.userId!)),
      converter: (store) => store.state.userEntityState.entities[notification.userId!],
      builder: (context,user){
        if(user == null) return const SpaceSavingWidget();
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: UserImageWidget(userId: user.id, diameter: 50)
                    ),
                    Text(user.userName),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Wrap(
                    children: [
                      Icon(
                        Icons.lightbulb,
                        color: Colors.yellow,
                      ),
                      Text(
                        "YAY!!! Your question has been solved!",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () => 
                          Navigator
                            .of(context)
                            .push(MaterialPageRoute(builder: (context) => DisplaySolutionPage(solutionId: notification.solutionId!))),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: const Text("Go to solution")
                            ),
                            const Icon(Icons.arrow_forward)
                          ],
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          timeago.format(notification.createdAt,locale: 'en_short')
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}