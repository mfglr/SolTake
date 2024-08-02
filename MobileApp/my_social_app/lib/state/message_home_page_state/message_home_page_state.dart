import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/models/conversation.dart';
import 'package:my_social_app/state/conversation_entity_state/conversation_state.dart';

class MessageHomePageState{
  final Iterable<int> ids;
  final DateTime? lastValue;
  final bool isLast;

  final bool isSynchronized;
  const MessageHomePageState({
    required this.ids,
    required this.lastValue,
    required this.isLast,
    required this.isSynchronized
  });

  MessageHomePageState synchronize(Iterable<Conversation> conversations)
    => MessageHomePageState(
        ids: [...conversations.map((e) => e.id),...ids],
        lastValue: ids.isEmpty && conversations.isNotEmpty ? conversations.last.messages.lastOrNull?.createdAt : lastValue,
        isLast: isLast,
        isSynchronized: true
      );

  MessageHomePageState nextPage(Iterable<Conversation> conversations)
    => MessageHomePageState(
        ids:[...ids,...conversations.map((e) => e.id)],
        lastValue: conversations.isNotEmpty ? conversations.last.messages.lastOrNull?.createdAt : lastValue,
        isLast: conversations.length < conversationsPerPage,
        isSynchronized: isSynchronized
      );
  
  MessageHomePageState prependOneAndRemovePrev(ConversationState conversation)
    => MessageHomePageState(
        ids: [conversation.id,...ids.where((e) => e != conversation.id)],
        isLast: isLast,
        lastValue: lastValue,
        isSynchronized: isSynchronized
      );

}