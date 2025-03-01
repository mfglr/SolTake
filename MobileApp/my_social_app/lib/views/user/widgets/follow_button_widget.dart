import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FollowButtonWidget extends StatelessWidget {
  final UserState user;
  const FollowButtonWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        final store = StoreProvider.of<AppState>(context,listen: false);
        if(user.isFollowed){
          store.dispatch(UnfollowUserAction(followedId: user.id));
        }
        else{
          store.dispatch(FollowUserAction(followedId: user.id));
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: Text(
              user.isFollowed ? 
                AppLocalizations.of(context)!.follow_button_widget_unfollow : 
                AppLocalizations.of(context)!.follow_button_widget_follow
              )
          ),
          Icon(user.isFollowed ? Icons.person_remove : Icons.person_add)
        ],
      )
    );
  }
}