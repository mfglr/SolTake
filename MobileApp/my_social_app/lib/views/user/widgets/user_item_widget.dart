import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';
import 'package:my_social_app/views/user/widgets/follow_button_widget.dart';
import 'package:my_social_app/views/user/widgets/remove_follower_button_widget.dart';
import 'package:my_social_app/views/user/widgets/user_image_with_names_widget.dart';

class UserItemWidget extends StatelessWidget {
  final UserState user;
  final bool removeFollowerButton;

  const UserItemWidget({
    super.key,
    required this.user,
    this.removeFollowerButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: TextButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(userId: user.id))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserImageWithNamesWidget(user: user),
              StoreConnector<AppState,int>(
                converter: (store) => store.state.accountState!.id,
                builder: (context,accountId){
                  if(removeFollowerButton && user.isFollower) return RemoveFollowerButtonWidget(user: user);
                  if(accountId != user.id) return FollowButtonWidget(user: user);
                  return const SpaceSavingWidget();
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}