import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/uploading_circle/uploading_file_status.dart';

@immutable
class UserEntityAction extends AppAction{
  const UserEntityAction();
}

@immutable
class LoadUserAction extends UserEntityAction{
  final int userId;
  const LoadUserAction({required this.userId});
}
@immutable
class LoadUserByUserNameAction extends UserEntityAction{
  final String userName;
  const LoadUserByUserNameAction({required this.userName});
}
@immutable
class AddUserAction extends UserEntityAction{
  final UserState user;
  const AddUserAction({required this.user});
}
@immutable
class AddUsersAction extends UserEntityAction{
  final Iterable<UserState> users;
  const AddUsersAction({required this.users});
}

@immutable
class MarkUserQuestionAsSolvedAction extends UserEntityAction{
  final int userId;
  final int questionId;
  const MarkUserQuestionAsSolvedAction({required this.userId, required this.questionId});
}
@immutable
class MarkUserQuestionAsUnsolvedAction extends UserEntityAction{
  final int userId;
  final int questionId;
  const MarkUserQuestionAsUnsolvedAction({required this.userId, required this.questionId});
}

@immutable
class AddNewFollowerAction extends UserEntityAction{
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
class FollowUserAction extends UserEntityAction{
  final int followedId;
  const FollowUserAction({required this.followedId});
}
@immutable
class FollowUserSuccessAction extends UserEntityAction{
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
class UnfollowUserAction extends UserEntityAction{
  final int followedId;
  const UnfollowUserAction({required this.followedId});
}
@immutable
class UnfollowUserSuccessAction extends UserEntityAction{
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
class RemoveFollowerAction extends UserEntityAction{
  final int followerId;
  const RemoveFollowerAction({required this.followerId});
}
@immutable
class RemoveFollowerSuccessAction extends UserEntityAction{
  final int currentUserId;
  final int followerId;
  final int followId;
  const RemoveFollowerSuccessAction({required this.currentUserId, required this.followerId, required this.followId});
}

//followers
@immutable
class NextUserFollowersAction extends UserEntityAction{
  final int userId;
  const NextUserFollowersAction({required this.userId});
}
@immutable
class NextUserFollowersSuccessAction extends UserEntityAction{
  final int userId;
  final Iterable<int> followIds;
  const NextUserFollowersSuccessAction({required this.userId, required this.followIds});
}
@immutable
class NextUserFollowersFailedAction extends UserEntityAction{
  final int userId;
  const NextUserFollowersFailedAction({required this.userId});
}

//followeds
@immutable
class NextUserFollowedsAction extends UserEntityAction{
  final int userId;
  const NextUserFollowedsAction({required this.userId});
}
@immutable
class NextUserFollowedsSuccessAction extends UserEntityAction{
  final int userId;
  final Iterable<int> followIds;
  const NextUserFollowedsSuccessAction({required this.userId, required this.followIds});
}
@immutable
class NextuserFollowedsFailedAction extends UserEntityAction{
  final int userId;
  const NextuserFollowedsFailedAction({required this.userId});
}


@immutable
class GetNextPageUserNotFollowedsIfNoPageAction extends UserEntityAction{
  final int userId;
  const GetNextPageUserNotFollowedsIfNoPageAction({required this.userId});
}
@immutable
class GetNextPageUserNotFollowedsIfReadyAction extends UserEntityAction{
  final int userId;
  const GetNextPageUserNotFollowedsIfReadyAction({required this.userId});
}
@immutable
class GetNextPageUserNotFollowedsAction extends UserEntityAction{
  final int userId;
  const GetNextPageUserNotFollowedsAction({required this.userId});
}
@immutable
class AddNextPageUserNotFollowedsAction extends UserEntityAction{
  final int userId;
  final Iterable<int> userIds;
  const AddNextPageUserNotFollowedsAction({required this.userId, required this.userIds});
}
@immutable
class RemoveUserNotFollowedAction extends UserEntityAction{
  final int userId;
  final int notFollowedId;
  const RemoveUserNotFollowedAction({required this.userId, required this.notFollowedId});
}
@immutable
class AddUserNotFollowedAction extends UserEntityAction{
  final int userId;
  final int notFollowedId;
  const AddUserNotFollowedAction({required this.userId, required this.notFollowedId});
}

@immutable
class NextUserQuestionsAction extends UserEntityAction{
  final int userId;
  const NextUserQuestionsAction({required this.userId});
}
@immutable
class NextUserQuestionsSuccessAction extends UserEntityAction{
  final int userId;
  final Iterable<int> questionIds;
  const NextUserQuestionsSuccessAction({required this.userId,required this.questionIds});
}
@immutable
class NextUserQuestionsFailedAction extends UserEntityAction{
  final int userId;
  const NextUserQuestionsFailedAction({required this.userId});
}


@immutable
class AddNewUserQuestionAction extends UserEntityAction{
  final int userId;
  final int questionId;
  const AddNewUserQuestionAction({required this.userId,required this.questionId});
}
@immutable
class RemoveUserQuestionAction extends UserEntityAction{
  final int userId;
  final int questionId;
  const RemoveUserQuestionAction({required this.userId, required this.questionId});
}

@immutable
class NextUserSolvedQuestionsAction extends UserEntityAction{
  final int userId;
  const NextUserSolvedQuestionsAction({required this.userId});
}
@immutable
class NextUserSolvedQuestionsSuccessAction extends UserEntityAction{
  final int userId;
  final Iterable<int> questionIds;
  const NextUserSolvedQuestionsSuccessAction({required this.userId, required this.questionIds});
}
@immutable
class NextUserSolvedQuestionsFailedAction extends UserEntityAction{
  final int userId;
  const NextUserSolvedQuestionsFailedAction({required this.userId});
}

@immutable
class NextUserUnsolvedQuestionsAction extends UserEntityAction{
  final int userId;
  const NextUserUnsolvedQuestionsAction({required this.userId});
}
@immutable
class NextUserUnsolvedQuestionsSuccessAction extends UserEntityAction{
  final int userId;
  final Iterable<int> questionIds;
  const NextUserUnsolvedQuestionsSuccessAction({required this.userId, required this.questionIds});
}
@immutable
class NextUserUnsolvedQuestionsFailedAction extends UserEntityAction{
  final int userId;
  const NextUserUnsolvedQuestionsFailedAction({required this.userId});
}

@immutable
class NextUserSavedQuestionsAction extends UserEntityAction{
  final int userId;
  const NextUserSavedQuestionsAction({required this.userId});
}
@immutable
class NextUserSavedQuestionsSuccessAction extends UserEntityAction{
  final int userId;
  final Iterable<int> savedIds;
  const NextUserSavedQuestionsSuccessAction({required this.userId, required this.savedIds});
}
@immutable
class NextUserSavedQuestionsFailedAction extends UserEntityAction{
  final int userId;
  const NextUserSavedQuestionsFailedAction({required this.userId});
}

@immutable
class AddUserSavedQuestionAction extends UserEntityAction{
  final int userId;
  final int saveId;
  const AddUserSavedQuestionAction({required this.userId, required this.saveId});
}
@immutable
class RemoveUserSavedQuestionAction extends UserEntityAction{
  final int userId;
  final int saveId;
  const RemoveUserSavedQuestionAction({required this.userId,required this.saveId});
}

@immutable
class NextUserSavedSolutionsAction extends UserEntityAction{
  final int userId;
  const NextUserSavedSolutionsAction({required this.userId});
}
@immutable
class NextUserSavedSolutionsSuccessAction extends UserEntityAction{
  final int userId;
  final Iterable<int> savedIds;
  const NextUserSavedSolutionsSuccessAction({required this.userId, required this.savedIds});
}
@immutable
class NextUserSavedSolutionsFailedAction extends UserEntityAction{
  final int userId;
  const NextUserSavedSolutionsFailedAction({required this.userId});
}

@immutable
class AddUserSavedSolutionAction extends UserEntityAction{
  final int userId;
  final int saveId;
  const AddUserSavedSolutionAction({required this.userId, required this.saveId});
}
@immutable
class RemoveUserSavedSolutionAction extends UserEntityAction{
  final int userId;
  final int saveId;
  const RemoveUserSavedSolutionAction({required this.userId, required this.saveId});
}

@immutable
class NextUserMessagesAction extends UserEntityAction{
  final int userId;
  const NextUserMessagesAction({required this.userId});
}
@immutable
class NextUserMessagesSuccessAction extends UserEntityAction{
  final int userId;
  final Iterable<int> messageIds;
  const NextUserMessagesSuccessAction({required this.userId, required this.messageIds});
}
@immutable
class NextUserMessagesFailedAction extends UserEntityAction{
  final int userId;
  const NextUserMessagesFailedAction({required this.userId});
}

@immutable
class AddUserMessageAction extends UserEntityAction{
  final int userId;
  final int messageId;
  const AddUserMessageAction({required this.userId, required this.messageId});
}
@immutable
class RemoveUserMessageAction extends UserEntityAction{
  final int userId;
  final int messageId;
  const RemoveUserMessageAction({
    required this.userId,
    required this.messageId
  });
}
@immutable
class RemoveUserMessagesAction extends UserEntityAction{
  final int userId;
  final Iterable<int> messageIds;
  const RemoveUserMessagesAction({required this.userId, required this.messageIds});
}

@immutable
class NextUserConversationsAction extends UserEntityAction{
  final int userId;
  const NextUserConversationsAction({required this.userId});
}
@immutable
class NextUserConversationsSuccessAction extends UserEntityAction{
  final int userId;
  final Iterable<int> ids;
  const NextUserConversationsSuccessAction({required this.userId,required this.ids});
}
@immutable
class NextUserConversationsFailedAction extends UserEntityAction{
  final int userId;
  const NextUserConversationsFailedAction({required this.userId});
}

@immutable
class AddUserConversationAction extends UserEntityAction{
  final int userId;
  final int id;
  const AddUserConversationAction({required this.userId, required this.id});
}
@immutable
class AddUserConversationInOrderAction extends UserEntityAction{
  final int userId;
  final int id;
  const AddUserConversationInOrderAction({required this.userId, required this.id});
}
@immutable
class RemoveUserConversationAction extends UserEntityAction{
  final int userId;
  final int id;
  const RemoveUserConversationAction({required this.userId, required this.id});
}

@immutable
class ChangeProfileImageStatusAction extends UserEntityAction{
  final int userId;
  final bool value;
  const ChangeProfileImageStatusAction({required this.userId, required this.value});
}
@immutable
class UpdateUserNameAction extends UserEntityAction{
  final String userName;
  const UpdateUserNameAction({required this.userName});
}
@immutable
class UpdateUserNameSuccessAction extends UserEntityAction{
  final int userId;
  final String userName;
  const UpdateUserNameSuccessAction({required this.userId,required this.userName});
}
@immutable
class UpdateNameAction extends UserEntityAction{
  final String name;
  const UpdateNameAction({required this.name});
}
@immutable
class UpdateNameSuccessAction extends UserEntityAction{
  final int userId;
  final String name;
  const UpdateNameSuccessAction({required this.userId, required this.name});
}
@immutable
class UpdateBiographyAction extends UserEntityAction{
  final String biography;
  const UpdateBiographyAction({required this.biography});
}
@immutable
class UpdateBiographySuccessAction extends UserEntityAction{
  final int userId;
  final String biography;
  const UpdateBiographySuccessAction({required this.userId, required this.biography});
}

@immutable
class ChangeUploadingUserImageStatusAction extends UserEntityAction{
  final int userId;
  final UploadingFileStatus status;
  const ChangeUploadingUserImageStatusAction({required this.userId, required this.status});
}
@immutable
class ChangeUploadingUserImageRateAction extends UserEntityAction{
  final int userId;
  final double rate;
  const ChangeUploadingUserImageRateAction({required this.userId, required this.rate});
}