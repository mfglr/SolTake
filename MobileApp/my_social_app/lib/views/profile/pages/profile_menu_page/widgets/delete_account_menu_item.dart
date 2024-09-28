import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/utilities/dialog_creator.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/profile_menu_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteAccountMenuItem extends StatelessWidget {
  const DeleteAccountMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileMenuItem(
      name: AppLocalizations.of(context)!.delete_account_menu_item_content,
      icon: Icons.delete_forever,
      displayRightArrow: false,
      iconColor: Colors.red,
      nameColor: Colors.red,
      onPressed: (){
        DialogCreator
          .showAppDialog(
            context,
            AppLocalizations.of(context)!.delete_account_menu_item_app_dialog_title,
            AppLocalizations.of(context)!.delete_account_menu_item_app_dialog_content,
            AppLocalizations.of(context)!.show_app_dialog_delete_button
          )
          .then((value){
            if(value){
              final store = StoreProvider.of<AppState>(context,listen: false);
              store.dispatch(const DeleteAccountAction());
              Navigator.of(context).pop();
            }
          });
      }
    );
  }
}