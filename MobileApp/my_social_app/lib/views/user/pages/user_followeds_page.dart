import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/user/widgets/user_items_widget.dart';

class UserFollowedsPage extends StatelessWidget {
  final int userId;
  const UserFollowedsPage({super.key,required this.userId});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserState>(
      converter: (store) => store.state.userEntityState.entities[userId]!,
      builder: (context,user) => Scaffold(
        appBar: AppBar(
          title: Text("${user.userName}' s Followings"),
        ),
        body: StoreConnector<AppState,Iterable<UserState>>(
          onInit: (store) => store.dispatch(GetNextPageUserFollowedsIfNoPageAction(userId: userId)),
          converter: (store) => store.state.userEntityState.getFolloweds(userId),
          builder: (context,users) => Container(
            margin: const EdgeInsets.all(5),
            child: UserItemsWidget(
              users : users,
              pagination: user.followeds,
              onScrollBotton: (){
                final store = StoreProvider.of<AppState>(context, listen: false);
                store.dispatch(GetNextPageUserFollowedsIfReadyAction(userId: userId));
              },
            )
          )
        )
      ),
    );
  }
}