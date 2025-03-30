import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';

class UserMessageState extends BaseEntity<int>{
  final Pagination<int,Id<int>> messageIds;
  UserMessageState({
    required super.id,
    required this.messageIds
  });

  factory UserMessageState.init(int userId) =>
    UserMessageState(id: userId, messageIds: Pagination.init(messagesPerPage, true));

  UserMessageState startLoadingNext() =>
    UserMessageState(
      id: id,
      messageIds:  messageIds.startLoadingNext()
    );

  UserMessageState addNextPage(Iterable<int> messageIds) =>
    UserMessageState(
      id: id,
      messageIds: this.messageIds.addNextPage(messageIds.map((messageId) => Id(id: messageId)))
    );

  UserMessageState stopLoadingNext() =>
    UserMessageState(
      id: id,
      messageIds: messageIds.stopLoadingNext()
    );

  UserMessageState prependUniqOne(int messageId) =>
    UserMessageState(
      id: id,
      messageIds: messageIds.prepenUniqOne(Id(id: messageId))
    );
  
  UserMessageState prependOne(int messageId) =>
    UserMessageState(
      id: id,
      messageIds: messageIds.prependOne(Id(id: messageId))
    );

  UserMessageState removeMany(Iterable<int> messageIds) =>
    UserMessageState(
      id: id,
      messageIds: this.messageIds.removeMany(messageIds)
    );
}