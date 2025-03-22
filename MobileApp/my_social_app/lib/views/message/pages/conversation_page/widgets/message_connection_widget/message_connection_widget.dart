import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/message_connection_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_connection_widget/message_connection_loading_widget.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_connection_widget/message_connection_ready_widget.dart';

class MessageConnectionWidget extends StatelessWidget {
  final int userId;
  const MessageConnectionWidget({
    super.key,
    required this.userId
  });

  @override
  Widget build(BuildContext context) =>
    StoreConnector<AppState,MessageConnectionState?>(
      onInit: (store) => store.dispatch(LoadMessageConnectionAction(userId: userId)),
      converter: (store) =>  store.state.messageConnectionEntityState.getValue(userId),
      builder: (context,messageConnection) =>
        messageConnection == null
          ? const MessageConnectionLoadingWidget()
          : MessageConnectionReadyWidget(messageConnection: messageConnection),
    );
}