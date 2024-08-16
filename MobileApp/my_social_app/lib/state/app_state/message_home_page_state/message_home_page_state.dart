import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/models/message.dart';

class MessageHomePageState{
  final bool isLastConversations;
  final bool isSynchronized;
  
  const MessageHomePageState({
    required this.isLastConversations,
    required this.isSynchronized
  });

  MessageHomePageState synchronize()
    => MessageHomePageState(
        isLastConversations: isLastConversations,
        isSynchronized: true
      );

  MessageHomePageState nextPage(Iterable<Message> messages)
    => MessageHomePageState(
        isLastConversations: messages.length < conversationsPerPage,
        isSynchronized: isSynchronized
      );
}