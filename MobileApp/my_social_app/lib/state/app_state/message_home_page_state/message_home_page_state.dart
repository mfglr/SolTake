import 'package:my_social_app/state/pagination/pagination.dart';

class MessageHomePageState{
  final Pagination conversations;
  
  const MessageHomePageState({required this.conversations});

  MessageHomePageState startLoadingNextConversations()
    => MessageHomePageState(conversations: conversations.startLoadingNext());
  MessageHomePageState addNextPageConversations(Iterable<int> messageIds)
    => MessageHomePageState(conversations: conversations.addNextPage(messageIds));
  MessageHomePageState stopLoadingNextConversations()
    => MessageHomePageState(conversations: conversations.stopLoadingNext());
}