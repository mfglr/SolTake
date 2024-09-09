import 'package:my_social_app/state/pagination/pagination.dart';

class MessageHomePageState{
  final Pagination conversations;
  
  const MessageHomePageState({
    required this.conversations
  });

  MessageHomePageState startLoadingNext()
    => MessageHomePageState(conversations: conversations.startLoadingNext());
 
  MessageHomePageState nextPage(Iterable<int> messageIds)
    => MessageHomePageState(conversations: conversations.addNextPage(messageIds));
}