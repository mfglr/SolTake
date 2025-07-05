import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/follow_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/uploading_circle/uploading_file_status.dart';

@immutable
class LoadUserAction extends AppAction{
  final int userId;
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
  final int userId;
  final int questionId;
  const MarkUserQuestionAsSolvedAction({required this.userId, required this.questionId});
}
@immutable
class MarkUserQuestionAsUnsolvedAction extends AppAction{
  final int userId;
  final int questionId;
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
  final int followedId;
  const FollowUserAction({required this.followedId});
}
@immutable
class FollowUserSuccessAction extends AppAction{
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
class UnfollowUserAction extends AppAction{
  final int followedId;
  const UnfollowUserAction({required this.followedId});
}
@immutable
class UnfollowUserSuccessAction extends AppAction{
  final int currentUserId;
  final int followedId;
  const UnfollowUserSuccessAction({
    required this.currentUserId,
    required this.followedId,
  });
}
@immutable
class RemoveFollowerAction extends AppAction{
  final int followerId;
  const RemoveFollowerAction({required this.followerId});
}
@immutable
class RemoveFollowerSuccessAction extends AppAction{
  final int currentUserId;
  final int followerId;
  const RemoveFollowerSuccessAction({required this.currentUserId, required this.followerId});
}

//followers
@immutable
class NextUserFollowersAction extends AppAction{
  final int userId;
  const NextUserFollowersAction({required this.userId});
}
@immutable
class NextUserFollowersSuccessAction extends AppAction{
  final int userId;
  final Iterable<FollowState> followers;
  const NextUserFollowersSuccessAction({required this.userId, required this.followers});
}
@immutable
class NextUserFollowersFailedAction extends AppAction{
  final int userId;
  const NextUserFollowersFailedAction({required this.userId});
}

//followeds
@immutable
class NextUserFollowedsAction extends AppAction{
  final int userId;
  const NextUserFollowedsAction({required this.userId});
}
@immutable
class NextUserFollowedsSuccessAction extends AppAction{
  final int userId;
  final Iterable<FollowState> followeds;
  const NextUserFollowedsSuccessAction({required this.userId, required this.followeds});
}
@immutable
class NextuserFollowedsFailedAction extends AppAction{
  final int userId;
  const NextuserFollowedsFailedAction({required this.userId});
}

@immutable
class AddNewUserQuestionAction extends AppAction{
  final int userId;
  final int questionId;
  const AddNewUserQuestionAction({required this.userId,required this.questionId});
}
@immutable
class RemoveUserQuestionAction extends AppAction{
  final int userId;
  final int questionId;
  const RemoveUserQuestionAction({required this.userId, required this.questionId});
}

@immutable
class UpdateUserNameAction extends AppAction{
  final String userName;
  const UpdateUserNameAction({required this.userName});
}
@immutable
class UpdateUserNameSuccessAction extends AppAction{
  final int userId;
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
  final int userId;
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
  final int userId;
  final String biography;
  const UpdateBiographySuccessAction({required this.userId, required this.biography});
}

@immutable
class ChangeUploadingUserImageStatusAction extends AppAction{
  final int userId;
  final UploadingFileStatus status;
  const ChangeUploadingUserImageStatusAction({required this.userId, required this.status});
}
@immutable
class ChangeUploadingUserImageRateAction extends AppAction{
  final int userId;
  final double rate;
  const ChangeUploadingUserImageRateAction({required this.userId, required this.rate});
}

@immutable
class UploadUserImageAction extends AppAction{
  final int userId;
  final AppFile image;
  const UploadUserImageAction({required this.userId, required this.image});
}
@immutable
class UploadUserImageSuccessAction extends AppAction{
  final int userId;
  final Multimedia image;
  const UploadUserImageSuccessAction({
    required this.userId,
    required this.image
  });
}
@immutable
class UploadUserImageFailedAction extends AppAction{
  final int userId;
  const UploadUserImageFailedAction({required this.userId});
}

@immutable
class ChangeUserImageRateAction extends AppAction{
  final int userId;
  final double rate;
  const ChangeUserImageRateAction({required this.userId, required this.rate});
}

@immutable
class RemoveUserImageAction extends AppAction{
  final int userId;
  const RemoveUserImageAction({required this.userId});
}
@immutable
class RemoveUserImageSuccessAction extends AppAction{
  final int userId;
  const RemoveUserImageSuccessAction({required this.userId});
}