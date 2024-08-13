import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/user_entity_state/user_state.dart';


@immutable
class LoadUserAction extends redux.Action{
  final int userId;
  const LoadUserAction({required this.userId});
}
@immutable
class LoadUserByUserNameAction extends redux.Action{
  final String userName;
  const LoadUserByUserNameAction({required this.userName});
}
@immutable
class AddUserAction extends redux.Action{
  final UserState user;
  const AddUserAction({required this.user});
}
@immutable
class AddUsersAction extends redux.Action{
  final Iterable<UserState> users;
  const AddUsersAction({required this.users});
}

@immutable
class GetNextPageUserFollowersIfNoPageAction extends redux.Action{
  final int userId;
  const GetNextPageUserFollowersIfNoPageAction({required this.userId});
}
@immutable
class GetNextPageUserFollowersIfReadyAction extends redux.Action{
  final int userId;
  const GetNextPageUserFollowersIfReadyAction({required this.userId});
}
@immutable
class GetNextPageUserFollowersAction extends redux.Action{
  final int userId;
  const GetNextPageUserFollowersAction({required this.userId});
}
@immutable
class AddNextPageUserFollowersAction extends redux.Action{
  final int userId;
  final Iterable<int> userIds;
  const AddNextPageUserFollowersAction({required this.userId, required this.userIds});
}

@immutable
class GetNextPageUserFollowedsIfNoPageAction extends redux.Action{
  final int userId;
  const GetNextPageUserFollowedsIfNoPageAction({required this.userId});
}
@immutable
class GetNextPageUserFollowedsIfReadyAction extends redux.Action{
  final int userId;
  const GetNextPageUserFollowedsIfReadyAction({required this.userId});
}
@immutable
class GetNextPageUserFollowedsAction extends redux.Action{
  final int userId;
  const GetNextPageUserFollowedsAction({required this.userId});
}
@immutable
class AddNextPageUserFollowedsAction extends redux.Action{
  final int userId;
  final Iterable<int> userIds;
  const AddNextPageUserFollowedsAction({required this.userId, required this.userIds});
}

@immutable
class MakeFollowRequestAction extends redux.Action{
  final int userId;
  const MakeFollowRequestAction({required this.userId});
}
@immutable
class MakeFollowRequestSuccessAction extends redux.Action{
  final int currentUserId;
  final int userId;
  const MakeFollowRequestSuccessAction({required this.currentUserId, required this.userId});
}

@immutable
class CancelFollowRequestAction extends redux.Action{
  final int userId;
  const CancelFollowRequestAction({required this.userId});
}
@immutable
class CancelFollowRequestSuccessAction extends redux.Action{
  final int currentUserId;
  final int userId;
  const CancelFollowRequestSuccessAction({required this.currentUserId,required this.userId});
}

@immutable
class GetNextPageUserQuestionsIfNoPageAction extends redux.Action{
  final int userId;
  const GetNextPageUserQuestionsIfNoPageAction({required this.userId});
}
@immutable
class GetNextPageUserQuestionsIfReadyAction extends redux.Action{
  final int userId;
  const GetNextPageUserQuestionsIfReadyAction({required this.userId});
}
@immutable
class GetNextPageUserQuestionsAction extends redux.Action{
  final int userId;
  const GetNextPageUserQuestionsAction({required this.userId});
}
@immutable
class AddNextPageUserQuestionsAction extends redux.Action{
  final int userId;
  final Iterable<int> questionIds;
  const AddNextPageUserQuestionsAction({required this.userId,required this.questionIds});
}
@immutable
class AddUserQuestionAction extends redux.Action{
  final int userId;
  final int questionId;
  const AddUserQuestionAction({required this.userId,required this.questionId});
}

@immutable
class GetNextPageUserMessagesIfNoPageAction extends redux.Action{
  final int userId;
  const GetNextPageUserMessagesIfNoPageAction({required this.userId});
}
@immutable
class GetNextPageUserMessagesIfReadyAction extends redux.Action{
  final int userId;
  const GetNextPageUserMessagesIfReadyAction({required this.userId});
}
@immutable
class GetNextPageUserMessagesAction extends redux.Action{
  final int userId;
  const GetNextPageUserMessagesAction({required this.userId});
}
@immutable
class AddNextPageUserMessagesAction extends redux.Action{
  final int userId;
  final Iterable<int> messageIds;
  const AddNextPageUserMessagesAction({required this.userId, required this.messageIds});
}
@immutable
class AddUserMessageAction extends redux.Action{
  final int userId;
  final int messageId;
  const AddUserMessageAction({required this.userId, required this.messageId});
}

@immutable
class ChangeProfileImageStatusAction extends redux.Action{
  final int userId;
  final bool value;
  const ChangeProfileImageStatusAction({required this.userId, required this.value});
}

@immutable
class UpdateUserNameAction extends redux.Action{
  final String userName;
  const UpdateUserNameAction({required this.userName});
}
@immutable
class UpdateUserNameSuccessAction extends redux.Action{
  final int userId;
  final String userName;
  const UpdateUserNameSuccessAction({required this.userId,required this.userName});
}

@immutable
class UpdateNameAction extends redux.Action{
  final String name;
  const UpdateNameAction({required this.name});
}

@immutable
class UpdateNameSuccessAction extends redux.Action{
  final int userId;
  final String name;
  const UpdateNameSuccessAction({required this.userId, required this.name});
}