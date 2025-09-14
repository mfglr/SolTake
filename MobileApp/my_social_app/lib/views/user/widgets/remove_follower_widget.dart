import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/follows_state/follow_state.dart';
import 'package:my_social_app/utilities/dialog_creator/dialog_creator.dart';

class RemoveFollowerWidget extends StatelessWidget {
  final FollowState follower;
  const RemoveFollowerWidget({
    super.key,
    required this.follower
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){
        DialogCreator
          .showAppDialog(
            context,
            AppLocalizations.of(context)!.show_remove_follower_dialog_title,
            AppLocalizations.of(context)!.show_remove_follower_dialog_content,
            AppLocalizations.of(context)!.show_remove_follower_dialog_content_of_approve_button,
          )
          .then((response){
            if(response && context.mounted){
              final store = StoreProvider.of<AppState>(context,listen: false);
              // store.dispatch(RemoveFollowerAction(followerId: follower.userId));
            }
          });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: Text(
              AppLocalizations.of(context)!.remove_follower_button_content
            )
          ),
          const Icon(Icons.remove)
        ],
      ),
    );
  }
}