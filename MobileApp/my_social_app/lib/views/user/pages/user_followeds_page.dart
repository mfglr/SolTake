import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/actionDispathcers.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/user/widgets/follow_button_widget.dart';
import 'package:my_social_app/views/user/widgets/no_follows.dart';
import 'package:my_social_app/views/user/widgets/user_items_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserFollowedsPage extends StatelessWidget {
  final int userId;
  const UserFollowedsPage({super.key,required this.userId});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserState>(
      converter: (store) => store.state.userEntityState.entities[userId]!,
      builder: (context,profileUser) => Scaffold(
        appBar: AppBar(
          title: Text(
            "${profileUser.userName} ${AppLocalizations.of(context)!.user_followeds_page_title}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: StoreConnector<AppState,Iterable<UserState>>(
          onInit: (store) => getNextPageIfNoPage(store,profileUser.followeds,NextUserFollowedsAction(userId: userId)),
          converter: (store) => store.state.selectFolloweds(userId),
          builder: (context,users) => Padding(
            padding: const EdgeInsets.all(8),
            child: Builder(
              builder: (context) {
                if(profileUser.numberOfFolloweds <= 0){
                  return NoFollows(
                    user: profileUser,
                    message: AppLocalizations.of(context)!.user_followeds_page_no_followings
                  );
                }
                return UserItemsWidget(
                  users : users,
                  pagination: profileUser.followeds,
                  rigthButtonBuilder: (user) => StoreConnector<AppState,int>(
                    converter: (store) => store.state.accountState!.id,
                    builder: (context,accountId){
                      if(accountId != user.id) return FollowButtonWidget(user: user);
                      return const SpaceSavingWidget();
                    }
                  ),
                  onScrollBottom: (){
                    final store = StoreProvider.of<AppState>(context, listen: false);
                    getNextPageIfReady(store,profileUser.followeds,NextUserFollowedsAction(userId: userId));
                  },
                );
              }
            )
          )
        )
      ),
    );
  }
}