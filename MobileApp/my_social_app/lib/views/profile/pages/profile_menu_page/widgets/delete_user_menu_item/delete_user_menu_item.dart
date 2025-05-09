import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/login_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/utilities/dialog_creator/dialog_creator.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/delete_user_menu_item/delete_user_menu_item_texts.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/profile_menu_item.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class DeleteUserMenuItem extends StatelessWidget {
  const DeleteUserMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return LanguageWidget(
      child: (language) => ProfileMenuItem(
        name: content[language]!,
        icon: Icons.delete_forever,
        displayRightArrow: false,
        iconColor: Colors.red,
        nameColor: Colors.red,
        onPressed: (){
          DialogCreator
            .showAppDialog(
              context,
              dialogTitle[language]!,
              dialogContent[language]!,
              dialogApproveButtonContent[language]!
            )
            .then((value){
              if(value && context.mounted){
                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(const DeleteUserAction());
                Navigator.of(context).pop();
              }
            });
        }
      ),
    );
  }
}