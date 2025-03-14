import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/string_helpers.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';

class CreateConversationPageUserItem extends StatelessWidget {
  final UserState user;
  final void Function(int userId) onPressed;

  const CreateConversationPageUserItem({
    super.key,
    required this.user,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: () => onPressed(user.id),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: AppAvatar(
                      avatar: user,
                      diameter: 50
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(compressText(user.userName, 20)),
                      if(user.biography != null)
                        Text(compressText(user.biography!, 50)),
                    ],
                  )
                ],
              ),
              StoreConnector<AppState,int>(
                converter: (store) => //0store.state.messageEntityState.selectNumberOfUnviewedMessagesOfUser(user.id),
                0,
                builder: (context,count){
                  if(count > 0) return Text(count.toString());
                  return const SizedBox.shrink();
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}