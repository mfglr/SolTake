import 'package:flutter/material.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/message/pages/conversation_page/conversation_page.dart';

class MessageButtonWidget extends StatelessWidget {
  final UserState user;
  const MessageButtonWidget({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConversationPage(userId: user.id,)));
      },
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 4),
              child: Text(
                AppLocalizations.of(context)!.message_button_widget_content
              )
            ),
            const Icon(Icons.message)
          ],
        ),
      )
    );
  }
}