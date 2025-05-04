import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/login_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/utilities/dialog_creator/dialog_creator.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/logout_menu_item/logout_menu_item_texts.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/profile_menu_item.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class LogoutMenuItem extends StatelessWidget {
  const LogoutMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return LanguageWidget(
      child: (language) => ProfileMenuItem(
        name: content[language]!,
        icon: Icons.logout,
        displayRightArrow: false,
        iconColor: Colors.red,
        nameColor: Colors.red,
        onPressed: () =>
          DialogCreator
            .showAppDialog(
              context,
              dialogTitle[language]!,
              dialogContent[language]!,
              approveButtonContent[language]!,
            )
            .then((value){
              if(value && context.mounted){
                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(const LogOutAction());
                Navigator.of(context).pop();
              }
            }),
      ),
    );
  }
}