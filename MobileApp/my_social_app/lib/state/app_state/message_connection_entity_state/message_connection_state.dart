import 'package:my_social_app/state/app_state/message_connection_entity_state/message_connection_status.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';

class MessageConnectionState extends BaseEntity<int>{
  final MessageConnectionStatus state;
  final int? typingId;

  MessageConnectionState({
    required super.id,
    required this.state,
    required this.typingId
  });

  MessageConnectionState changeState(MessageConnectionStatus state,int? typingId) =>
    MessageConnectionState(
      id: id,
      state: state,
      typingId: typingId
    );
  
}