import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/user/widgets/follow_button_widget.dart';
import 'package:my_social_app/views/user/widgets/user_items_widget.dart';

class UsersToFollowWidget extends StatelessWidget {
  final UserState user;

  const UsersToFollowWidget({
    super.key,
    required this.user
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,Iterable<UserState>>(
      onInit: (store) => store.dispatch(GetNextPageUserNotFollowedsIfNoPageAction(userId: user.id)),
      converter: (store) => store.state.selectNotFolloweds(user.id),
      builder: (context,users){
        if(user.notFolloweds.isLast && user.notFolloweds.ids.isEmpty) return const SpaceSavingWidget();
        return Column(
          children: [
            const Text(
              "Users To Follow For You",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
              textAlign: TextAlign.center,
            ),
            UserItemsWidget(
              users: users,
              pagination: user.notFolloweds,
              rigthButtonBuilder: (user) => FollowButtonWidget(user: user),
              onScrollBotton: (){
                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(GetNextPageUserNotFollowedsIfReadyAction(userId: user.id));
              },
            ),
          ],
        );
      }
    );
  }
}