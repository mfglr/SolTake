import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/utilities/dialog_creator.dart';

class RemoveFollowerButton extends StatelessWidget {
  
  final UserState user;
  const RemoveFollowerButton({super.key,required this.user});

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
            if(response){
              final store = StoreProvider.of<AppState>(context,listen: false);
              store.dispatch(RemoveFollowerAction(followerId: user.id));
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