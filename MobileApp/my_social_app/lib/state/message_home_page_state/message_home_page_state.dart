import 'package:my_social_app/state/ids.dart';

class MessageHomePageState{
  final Ids users;
  final bool isSynchronized;
  
  const MessageHomePageState({
    required this.users,
    required this.isSynchronized
  });

  MessageHomePageState addNewMessageSenders(Iterable<int> userIds)
    => MessageHomePageState(
        users: users.prependMany(userIds),
        isSynchronized: true
      );

  MessageHomePageState nextPage(Iterable<int> userIds)
    => MessageHomePageState(
        users: users.nextPage(userIds),
        isSynchronized: isSynchronized
      );
  
  MessageHomePageState prependOneAndRemovePrev(int userId)
    => MessageHomePageState(
        users: users.prependOneAndRemovePrev(userId),
        isSynchronized: isSynchronized
      );
}