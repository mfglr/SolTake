import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';

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
class AddNewFollowerAction extends redux.Action{
  final int curentUserId;
  final int followerId;
  final int followId;
  const AddNewFollowerAction({
    required this.curentUserId,
    required this.followerId,
    required this.followId
  });
}

@immutable
class FollowUserAction extends redux.Action{
  final int followedId;
  const FollowUserAction({required this.followedId});
}
@immutable
class FollowUserSuccessAction extends redux.Action{
  final int currentUserId;
  final int followedId;
  final int followId;
  const FollowUserSuccessAction({
    required this.currentUserId,
    required this.followedId,
    required this.followId
  });
}
@immutable
class UnfollowUserAction extends redux.Action{
  final int followedId;
  const UnfollowUserAction({required this.followedId});
}
@immutable
class UnfollowUserSuccessAction extends redux.Action{
  final int currentUserId;
  final int followedId;
  final int followId;
  const UnfollowUserSuccessAction({
    required this.currentUserId,
    required this.followedId,
    required this.followId
  });
}
@immutable
class RemoveFollowerAction extends redux.Action{
  final int followerId;
  const RemoveFollowerAction({required this.followerId});
}
@immutable
class RemoveFollowerSuccessAction extends redux.Action{
  final int currentUserId;
  final int followerId;
  final int followId;
  const RemoveFollowerSuccessAction({required this.currentUserId, required this.followerId, required this.followId});
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
  final Iterable<int> followIds;
  const AddNextPageUserFollowersAction({required this.userId, required this.followIds});
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
  final Iterable<int> followIds;
  const AddNextPageUserFollowedsAction({required this.userId, required this.followIds});
}

@immutable
class GetNextPageUserNotFollowedsIfNoPageAction extends redux.Action{
  final int userId;
  const GetNextPageUserNotFollowedsIfNoPageAction({required this.userId});
}
@immutable
class GetNextPageUserNotFollowedsIfReadyAction extends redux.Action{
  final int userId;
  const GetNextPageUserNotFollowedsIfReadyAction({required this.userId});
}
@immutable
class GetNextPageUserNotFollowedsAction extends redux.Action{
  final int userId;
  const GetNextPageUserNotFollowedsAction({required this.userId});
}
@immutable
class AddNextPageUserNotFollowedsAction extends redux.Action{
  final int userId;
  final Iterable<int> userIds;
  const AddNextPageUserNotFollowedsAction({required this.userId, required this.userIds});
}
@immutable
class RemoveUserNotFollowedAction extends redux.Action{
  final int userId;
  final int notFollowedId;
  const RemoveUserNotFollowedAction({required this.userId, required this.notFollowedId});
}
@immutable
class AddUserNotFollowedAction extends redux.Action{
  final int userId;
  final int notFollowedId;
  const AddUserNotFollowedAction({required this.userId, required this.notFollowedId});
}

@immutable
class MarkUserQuestionAsSolvedAction extends redux.Action{
  final int userId;
  final int questionId;
  const MarkUserQuestionAsSolvedAction({required this.userId, required this.questionId});
}
@immutable
class MarkUserQuestionAsUnsolvedAction extends redux.Action{
  final int userId;
  final int questionId;
  const MarkUserQuestionAsUnsolvedAction({required this.userId, required this.questionId});
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
class AddNewUserQuestionAction extends redux.Action{
  final int userId;
  final int questionId;
  const AddNewUserQuestionAction({required this.userId,required this.questionId});
}
@immutable
class RemoveUserQuestionAction extends redux.Action{
  final int userId;
  final int questionId;
  const RemoveUserQuestionAction({required this.userId, required this.questionId});
}


@immutable
class GetNextPageUserSolvedQuestionsIfNoPageAction extends redux.Action{
  final int userId;
  const GetNextPageUserSolvedQuestionsIfNoPageAction({required this.userId});
}
@immutable
class GetNextPageUserSolvedQuestionsIfReadyAction extends redux.Action{
  final int userId;
  const GetNextPageUserSolvedQuestionsIfReadyAction({required this.userId});
}
@immutable
class GetNextPageUserSolvedQuestionsAction extends redux.Action{
  final int userId;
  const GetNextPageUserSolvedQuestionsAction({required this.userId});
}
@immutable
class AddNextPageUserSolvedQuestionsAction extends redux.Action{
  final int userId;
  final Iterable<int> questionIds;
  const AddNextPageUserSolvedQuestionsAction({required this.userId, required this.questionIds});
}

@immutable
class GetNextPageUserUnsolvedQuestionsIfNoPageAction extends redux.Action{
  final int userId;
  const GetNextPageUserUnsolvedQuestionsIfNoPageAction({required this.userId});
}
@immutable
class GetNextPageUserUnsolvedQuestionsIfReadyAction extends redux.Action{
  final int userId;
  const GetNextPageUserUnsolvedQuestionsIfReadyAction({required this.userId});
}
@immutable
class GetNextPageUserUnsolvedQuestionsAction extends redux.Action{
  final int userId;
  const GetNextPageUserUnsolvedQuestionsAction({required this.userId});
}
@immutable
class AddNextPageUserUnsolvedQuestionsAction extends redux.Action{
  final int userId;
  final Iterable<int> questionIds;
  const AddNextPageUserUnsolvedQuestionsAction({required this.userId, required this.questionIds});
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
class RemoveUserMessageAction extends redux.Action{
  final int userId;
  final int messageId;
  const RemoveUserMessageAction({
    required this.userId,
    required this.messageId
  });
}
@immutable
class RemoveUserMessagesAction extends redux.Action{
  final int userId;
  final Iterable<int> messageIds;
  const RemoveUserMessagesAction({required this.userId, required this.messageIds});
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
@immutable
class UpdateBiographyAction extends redux.Action{
  final String biography;
  const UpdateBiographyAction({required this.biography});
}
@immutable
class UpdateBiographySuccessAction extends redux.Action{
  final int userId;
  final String biography;
  const UpdateBiographySuccessAction({required this.userId, required this.biography});
}