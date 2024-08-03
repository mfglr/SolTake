import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/models/user.dart';

class MessageHomePageState{
  final bool isLastConversations;
  final bool isSynchronized;
  
  const MessageHomePageState({
    required this.isLastConversations,
    required this.isSynchronized
  });

  MessageHomePageState addNewMessageSenders()
    => MessageHomePageState(
        isLastConversations: isLastConversations,
        isSynchronized: true
      );

  MessageHomePageState nextPage(Iterable<User> users)
    => MessageHomePageState(
        isLastConversations: users.length < conversationsPerPage,
        isSynchronized: isSynchronized
      );
}