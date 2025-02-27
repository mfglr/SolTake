import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/uploading_circle/uploading_file_status.dart';

@immutable
class LoadUserAction extends AppAction{
  final num userId;
  const LoadUserAction({required this.userId});
}
@immutable
class LoadUserByUserNameAction extends AppAction{
  final String userName;
  const LoadUserByUserNameAction({required this.userName});
}
@immutable
class AddUserAction extends AppAction{
  final UserState user;
  const AddUserAction({required this.user});
}
@immutable
class AddUsersAction extends AppAction{
  final Iterable<UserState> users;
  const AddUsersAction({required this.users});
}

@immutable
class MarkUserQuestionAsSolvedAction extends AppAction{
  final num userId;
  final num questionId;
  const MarkUserQuestionAsSolvedAction({required this.userId, required this.questionId});
}
@immutable
class MarkUserQuestionAsUnsolvedAction extends AppAction{
  final num userId;
  final num questionId;
  const MarkUserQuestionAsUnsolvedAction({required this.userId, required this.questionId});
}


@immutable
class AddNewFollowerAction extends AppAction{
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
class FollowUserAction extends AppAction{
  final num followedId;
  const FollowUserAction({required this.followedId});
}
@immutable
class FollowUserSuccessAction extends AppAction{
  final num currentUserId;
  final num followedId;
  final num followId;
  const FollowUserSuccessAction({
    required this.currentUserId,
    required this.followedId,
    required this.followId
  });
}
@immutable
class UnfollowUserAction extends AppAction{
  final num followedId;
  const UnfollowUserAction({required this.followedId});
}
@immutable
class UnfollowUserSuccessAction extends AppAction{
  final num currentUserId;
  final num followedId;
  final num followId;
  const UnfollowUserSuccessAction({
    required this.currentUserId,
    required this.followedId,
    required this.followId
  });
}
@immutable
class RemoveFollowerAction extends AppAction{
  final num followerId;
  const RemoveFollowerAction({required this.followerId});
}
@immutable
class RemoveFollowerSuccessAction extends AppAction{
  final num currentUserId;
  final num followerId;
  final num followId;
  const RemoveFollowerSuccessAction({required this.currentUserId, required this.followerId, required this.followId});
}

//followers
@immutable
class NextUserFollowersAction extends AppAction{
  final num userId;
  const NextUserFollowersAction({required this.userId});
}
@immutable
class NextUserFollowersSuccessAction extends AppAction{
  final num userId;
  final Iterable<num> followIds;
  const NextUserFollowersSuccessAction({required this.userId, required this.followIds});
}
@immutable
class NextUserFollowersFailedAction extends AppAction{
  final num userId;
  const NextUserFollowersFailedAction({required this.userId});
}

//followeds
@immutable
class NextUserFollowedsAction extends AppAction{
  final num userId;
  const NextUserFollowedsAction({required this.userId});
}
@immutable
class NextUserFollowedsSuccessAction extends AppAction{
  final num userId;
  final Iterable<num> followIds;
  const NextUserFollowedsSuccessAction({required this.userId, required this.followIds});
}
@immutable
class NextuserFollowedsFailedAction extends AppAction{
  final num userId;
  const NextuserFollowedsFailedAction({required this.userId});
}


@immutable
class GetNextPageUserNotFollowedsIfNoPageAction extends AppAction{
  final num userId;
  const GetNextPageUserNotFollowedsIfNoPageAction({required this.userId});
}
@immutable
class GetNextPageUserNotFollowedsIfReadyAction extends AppAction{
  final num userId;
  const GetNextPageUserNotFollowedsIfReadyAction({required this.userId});
}
@immutable
class GetNextPageUserNotFollowedsAction extends AppAction{
  final num userId;
  const GetNextPageUserNotFollowedsAction({required this.userId});
}
@immutable
class AddNextPageUserNotFollowedsAction extends AppAction{
  final num userId;
  final Iterable<num> userIds;
  const AddNextPageUserNotFollowedsAction({required this.userId, required this.userIds});
}
@immutable
class RemoveUserNotFollowedAction extends AppAction{
  final num userId;
  final num notFollowedId;
  const RemoveUserNotFollowedAction({required this.userId, required this.notFollowedId});
}
@immutable
class AddUserNotFollowedAction extends AppAction{
  final num userId;
  final num notFollowedId;
  const AddUserNotFollowedAction({required this.userId, required this.notFollowedId});
}

@immutable
class NextUserQuestionsAction extends AppAction{
  final num userId;
  const NextUserQuestionsAction({required this.userId});
}
@immutable
class NextUserQuestionsSuccessAction extends AppAction{
  final num userId;
  final Iterable<num> questionIds;
  const NextUserQuestionsSuccessAction({required this.userId,required this.questionIds});
}
@immutable
class NextUserQuestionsFailedAction extends AppAction{
  final num userId;
  const NextUserQuestionsFailedAction({required this.userId});
}


@immutable
class AddNewUserQuestionAction extends AppAction{
  final num userId;
  final num questionId;
  const AddNewUserQuestionAction({required this.userId,required this.questionId});
}
@immutable
class RemoveUserQuestionAction extends AppAction{
  final num userId;
  final num questionId;
  const RemoveUserQuestionAction({required this.userId, required this.questionId});
}

@immutable
class NextUserSolvedQuestionsAction extends AppAction{
  final num userId;
  const NextUserSolvedQuestionsAction({required this.userId});
}
@immutable
class NextUserSolvedQuestionsSuccessAction extends AppAction{
  final num userId;
  final Iterable<num> questionIds;
  const NextUserSolvedQuestionsSuccessAction({required this.userId, required this.questionIds});
}
@immutable
class NextUserSolvedQuestionsFailedAction extends AppAction{
  final num userId;
  const NextUserSolvedQuestionsFailedAction({required this.userId});
}

@immutable
class NextUserUnsolvedQuestionsAction extends AppAction{
  final num userId;
  const NextUserUnsolvedQuestionsAction({required this.userId});
}
@immutable
class NextUserUnsolvedQuestionsSuccessAction extends AppAction{
  final num userId;
  final Iterable<num> questionIds;
  const NextUserUnsolvedQuestionsSuccessAction({required this.userId, required this.questionIds});
}
@immutable
class NextUserUnsolvedQuestionsFailedAction extends AppAction{
  final num userId;
  const NextUserUnsolvedQuestionsFailedAction({required this.userId});
}

@immutable
class NextUserSavedQuestionsAction extends AppAction{
  final num userId;
  const NextUserSavedQuestionsAction({required this.userId});
}
@immutable
class NextUserSavedQuestionsSuccessAction extends AppAction{
  final num userId;
  final Iterable<num> savedIds;
  const NextUserSavedQuestionsSuccessAction({required this.userId, required this.savedIds});
}
@immutable
class NextUserSavedQuestionsFailedAction extends AppAction{
  final num userId;
  const NextUserSavedQuestionsFailedAction({required this.userId});
}

@immutable
class AddUserSavedQuestionAction extends AppAction{
  final num userId;
  final num saveId;
  const AddUserSavedQuestionAction({required this.userId, required this.saveId});
}
@immutable
class RemoveUserSavedQuestionAction extends AppAction{
  final num userId;
  final num saveId;
  const RemoveUserSavedQuestionAction({required this.userId,required this.saveId});
}

@immutable
class NextUserSavedSolutionsAction extends AppAction{
  final num userId;
  const NextUserSavedSolutionsAction({required this.userId});
}
@immutable
class NextUserSavedSolutionsSuccessAction extends AppAction{
  final num userId;
  final Iterable<num> savedIds;
  const NextUserSavedSolutionsSuccessAction({required this.userId, required this.savedIds});
}
@immutable
class NextUserSavedSolutionsFailedAction extends AppAction{
  final num userId;
  const NextUserSavedSolutionsFailedAction({required this.userId});
}

@immutable
class AddUserSavedSolutionAction extends AppAction{
  final num userId;
  final num saveId;
  const AddUserSavedSolutionAction({required this.userId, required this.saveId});
}
@immutable
class RemoveUserSavedSolutionAction extends AppAction{
  final num userId;
  final num saveId;
  const RemoveUserSavedSolutionAction({required this.userId, required this.saveId});
}

@immutable
class NextUserMessagesAction extends AppAction{
  final num userId;
  const NextUserMessagesAction({required this.userId});
}
@immutable
class NextUserMessagesSuccessAction extends AppAction{
  final num userId;
  final Iterable<num> messageIds;
  const NextUserMessagesSuccessAction({required this.userId, required this.messageIds});
}
@immutable
class NextUserMessagesFailedAction extends AppAction{
  final num userId;
  const NextUserMessagesFailedAction({required this.userId});
}

@immutable
class AddUserMessageAction extends AppAction{
  final num userId;
  final num messageId;
  const AddUserMessageAction({required this.userId, required this.messageId});
}
@immutable
class RemoveUserMessageAction extends AppAction{
  final num userId;
  final num messageId;
  const RemoveUserMessageAction({
    required this.userId,
    required this.messageId
  });
}
@immutable
class RemoveUserMessagesAction extends AppAction{
  final num userId;
  final Iterable<num> messageIds;
  const RemoveUserMessagesAction({required this.userId, required this.messageIds});
}

@immutable
class NextUserConversationsAction extends AppAction{
  final num userId;
  const NextUserConversationsAction({required this.userId});
}
@immutable
class NextUserConversationsSuccessAction extends AppAction{
  final num userId;
  final Iterable<num> ids;
  const NextUserConversationsSuccessAction({required this.userId,required this.ids});
}
@immutable
class NextUserConversationsFailedAction extends AppAction{
  final num userId;
  const NextUserConversationsFailedAction({required this.userId});
}

@immutable
class AddUserConversationAction extends AppAction{
  final num userId;
  final num id;
  const AddUserConversationAction({required this.userId, required this.id});
}
@immutable
class AddUserConversationInOrderAction extends AppAction{
  final num userId;
  final num id;
  const AddUserConversationInOrderAction({required this.userId, required this.id});
}
@immutable
class RemoveUserConversationAction extends AppAction{
  final num userId;
  final num id;
  const RemoveUserConversationAction({required this.userId, required this.id});
}

@immutable
class UpdateUserNameAction extends AppAction{
  final String userName;
  const UpdateUserNameAction({required this.userName});
}
@immutable
class UpdateUserNameSuccessAction extends AppAction{
  final num userId;
  final String userName;
  const UpdateUserNameSuccessAction({required this.userId,required this.userName});
}
@immutable
class UpdateNameAction extends AppAction{
  final String name;
  const UpdateNameAction({required this.name});
}
@immutable
class UpdateNameSuccessAction extends AppAction{
  final num userId;
  final String name;
  const UpdateNameSuccessAction({required this.userId, required this.name});
}
@immutable
class UpdateBiographyAction extends AppAction{
  final String biography;
  const UpdateBiographyAction({required this.biography});
}
@immutable
class UpdateBiographySuccessAction extends AppAction{
  final num userId;
  final String biography;
  const UpdateBiographySuccessAction({required this.userId, required this.biography});
}

@immutable
class ChangeUploadingUserImageStatusAction extends AppAction{
  final num userId;
  final UploadingFileStatus status;
  const ChangeUploadingUserImageStatusAction({required this.userId, required this.status});
}
@immutable
class ChangeUploadingUserImageRateAction extends AppAction{
  final num userId;
  final double rate;
  const ChangeUploadingUserImageRateAction({required this.userId, required this.rate});
}

@immutable
class UploadUserImageAction extends AppAction{
  final num userId;
  final AppFile image;
  const UploadUserImageAction({required this.userId, required this.image});
}
@immutable
class UploadUserImageSuccessAction extends AppAction{
  final num userId;
  final Multimedia image;
  const UploadUserImageSuccessAction({
    required this.userId,
    required this.image
  });
}
@immutable
class UploadUserImageFailedAction extends AppAction{
  final num userId;
  const UploadUserImageFailedAction({required this.userId});
}

@immutable
class ChangeUserImageRateAction extends AppAction{
  final num userId;
  final double rate;
  const ChangeUserImageRateAction({required this.userId, required this.rate});
}

@immutable
class RemoveUserImageAction extends AppAction{
  final num userId;
  const RemoveUserImageAction({required this.userId});
}
@immutable
class RemoveUserImageSuccessAction extends AppAction{
  final num userId;
  const RemoveUserImageSuccessAction({required this.userId});
}