import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_user_block_state/action.dart';
import 'package:my_social_app/state/users_state/user_state.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/user/pages/user_page/widgets/user_block_alert_dialog/user_block_alert_dialog.dart';
import 'package:my_social_app/views/user/pages/user_page/widgets/user_popup_menu/user_popup_menu_texts.dart';

enum UserActions{
  block
}

class UserPopupMenu extends StatelessWidget {
  final UserState user;

  const UserPopupMenu({
    super.key,
    required this.user
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<UserActions>(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onSelected: (value) async {
        switch(value){
          case UserActions.block:
            showDialog(
              context: context,
              builder: (context) => const UserBlockAlertDialog()
            )
            .then((value){
              if(value != null && value && context.mounted){
                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(BlockUserAction(userId: user.id));
                Navigator.of(context).pop();
              }
            });
            return;
        }
      },
      itemBuilder: (context) {
        return [
          if(!user.isCurrentUser)
            PopupMenuItem<UserActions>(
              value: UserActions.block,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LanguageWidget(
                    child: (language) => Text(
                      block[language]!,
                      style: const TextStyle(
                        color: Colors.red
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.block,
                    color: Colors.red,
                  )
                ],
              )
            )
        ];
      }
    );
  }
}