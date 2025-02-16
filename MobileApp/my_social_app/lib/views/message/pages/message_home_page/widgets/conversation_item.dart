import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_status_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';

class ConversationItem extends StatelessWidget {
  final MessageState message;
  final bool isSelected;
  final void Function(int conversationId) onLongPressed;
  final void Function(int conversationId,bool isSelected) onPress;

  const ConversationItem({
    super.key,
    required this.message,
    required this.isSelected,
    required this.onLongPressed,
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,int>(
      converter: (store) => store.state.loginState!.id,
      builder: (context,accountId){
        return Card(
          color: isSelected ? Colors.black.withOpacity(0.2) : null,
          child: TextButton(
            onLongPress: () => onLongPressed(message.conversationId),
            onPressed: () => onPress(message.conversationId, isSelected),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: AppAvatar(
                        avatar: message,
                        diameter: 50
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message.userName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: Text(
                                message.formatContent(25) ?? AppLocalizations.of(context)!.conversation_item,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal
                                ),
                              ),
                            ),
                            if(message.isOwner)
                              MessageStatusWidget(message: message),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                StoreConnector<AppState,int>(
                  converter: (store) => store.state.messageEntityState.selectNumberOfUnviewedMessagesOfUser(message.conversationId),
                  builder: (context,count){
                    if(count > 0) return Text(count.toString());
                    return const SizedBox.shrink();
                  }
                )
              ],
            ),
          )
        );
      }
    );
  }
}