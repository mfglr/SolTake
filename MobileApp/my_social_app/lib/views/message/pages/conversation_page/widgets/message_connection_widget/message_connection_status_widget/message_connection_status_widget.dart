import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/message_connection_state.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/message_connection_status.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_connection_widget/message_connection_status_widget/message_connection_status_texts.dart';
import 'package:my_social_app/views/shared/app_date_widget.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class MessageConnectionStatusWidget extends StatelessWidget {
  final MessageConnectionState messageConnection;
  const MessageConnectionStatusWidget({
    super.key,
    required this.messageConnection
  });

  String getTextByStatus(String language, int accountId){
    if(messageConnection.state == MessageConnectionStatus.ofline){
      return ofline[language]!;
    }
    if(messageConnection.state == MessageConnectionStatus.typing && messageConnection.userId == accountId){
      return writing[language]!;
    }
    return online[language]!;
  }

  Widget getWidgetByStatus(int accountId){
    if(messageConnection.state == MessageConnectionStatus.ofline){
      return AppDateWidget(
        dateTime: messageConnection.lastSeenAt!,
        style: const TextStyle(
          fontSize: 11
        ),
      );
    }
    if(messageConnection.state == MessageConnectionStatus.typing && messageConnection.userId == accountId){
      return LoadingAnimationWidget.waveDots(color: Colors.black, size: 11);
    }
    return const Icon(
      Icons.signal_cellular_alt_sharp,
      size: 11
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,int>(
      converter: (store) => store.state.login.login!.id,
      builder: (context,accountId) => Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: LanguageWidget(
              child: (language) => Text(
                getTextByStatus(language, accountId),
                style: const TextStyle(
                  fontSize: 11
                ),
              )
            ),
          ),
          getWidgetByStatus(accountId)
        ],
      ),
    );
  }
}