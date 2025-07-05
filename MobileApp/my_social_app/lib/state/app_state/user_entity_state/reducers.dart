import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/follow_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';


EntityState<int,UserState> addUserReducer(EntityState<int,UserState> prev,AddUserAction action)
  => prev.appendOne(action.user);
EntityState<int,UserState> addUsersReducer(EntityState<int,UserState> prev,AddUsersAction action)
  => prev.appendMany(action.users);

//following ************************************* following//

//followers
EntityState<int,UserState> nextFollowersReducer(EntityState<int,UserState> prev,NextUserFollowersAction action)
  => prev.updateOne(prev.getValue(action.userId)!.startLoadingNextFollowers());
EntityState<int,UserState> nextFollowersSuccessReducer(EntityState<int,UserState> prev,NextUserFollowersSuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.addNextFollowers(action.followers));
EntityState<int,UserState> nextFollowersFailedReducer(EntityState<int,UserState> prev,NextUserFollowersFailedAction action)
  => prev.updateOne(prev.getValue(action.userId)!.stopLoadingNextFollowers());

//followeds
EntityState<int,UserState> nextFollowedsReducer(EntityState<int,UserState> prev,NextUserFollowedsAction action)
  => prev.updateOne(prev.getValue(action.userId)!.startLoadingNextFolloweds());
EntityState<int,UserState> nextFollowedsSuccessReducer(EntityState<int,UserState> prev,NextUserFollowedsSuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.addNextFolloweds(action.followeds));
EntityState<int,UserState> nextFollowedsFailedReducer(EntityState<int,UserState> prev,NextuserFollowedsFailedAction action)
  => prev.updateOne(prev.getValue(action.userId)!.stopLoadingNextFolloweds());

EntityState<int,UserState> followUserSuccessReducer(EntityState<int,UserState> prev, FollowUserSuccessAction action){
  var follower = prev.getValue(action.currentUserId)!;
  var followed = prev.getValue(action.followedId)!;
  return prev.updateMany(
    [
      follower.addFollowedToCurrentUser(
        FollowState(
          id: action.followId,
          userId: followed.id,
          userName: followed.userName,
          name: followed.name,
          image: followed.image,
          isFollower: followed.isFollower,
          isFollowed: true,
        )
      ),
      followed.addFollower(
        FollowState(
          id: action.followId,
          userId: follower.id,
          userName: follower.userName,
          name: follower.name,
          image: follower.image,
          isFollower: false,
          isFollowed: false
        )
      )
    ]
  );
}
EntityState<int,UserState> unfollowUserSuccessReducer(EntityState<int,UserState> prev, UnfollowUserSuccessAction action) =>
  prev.updateMany(
    [
      prev.getValue(action.currentUserId)!.removeFollowedToCurrentUser(action.followedId),
      prev.getValue(action.followedId)!.removeFollower(action.currentUserId)
    ]
  );
EntityState<int,UserState> removeFollowerSuccessReducer(EntityState<int,UserState> prev, RemoveFollowerSuccessAction action) =>
  prev.updateMany(
    [
      prev.getValue(action.followerId)!.removeFollowed(action.currentUserId),
      prev.getValue(action.currentUserId)!.removeFollowerToCurrentUser(action.followerId),
    ]
  );

EntityState<int,UserState> updateUserNameReducer(EntityState<int,UserState> prev,UpdateUserNameSuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.updateUserName(action.userName));
EntityState<int,UserState> updateNameReducer(EntityState<int,UserState> prev, UpdateNameSuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.updateName(action.name));
EntityState<int,UserState> updateBiographyReducer(EntityState<int,UserState> prev, UpdateBiographySuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.updateBiography(action.biography));

EntityState<int,UserState> uploadUserImageReducer(EntityState<int,UserState> prev,UploadUserImageAction action)
  => prev.updateOne(prev.getValue(action.userId)!.uploadImage(action.image));
EntityState<int,UserState> uploadUserImageSuccessReducer(EntityState<int,UserState> prev, UploadUserImageSuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.uploadImageSuccess(action.image));
EntityState<int,UserState> uploadUserImageFailedReducer(EntityState<int,UserState> prev,UploadUserImageFailedAction action)
  => prev.updateOne(prev.getValue(action.userId)!.uploadImageFailed());
EntityState<int,UserState> remvoeUserImageReducer(EntityState<int,UserState> prev, RemoveUserImageSuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.removeImage());
EntityState<int,UserState> changeUserImageRateReducer(EntityState<int,UserState> prev, ChangeUserImageRateAction action)
  => prev.updateOne(prev.getValue(action.userId)!.changeRate(action.rate));


Reducer<EntityState<int,UserState>> userEntityStateReducers = combineReducers<EntityState<int,UserState>>([
  TypedReducer<EntityState<int,UserState>,AddUserAction>(addUserReducer).call,
  TypedReducer<EntityState<int,UserState>,AddUsersAction>(addUsersReducer).call,

  //followers
  TypedReducer<EntityState<int,UserState>,NextUserFollowersAction>(nextFollowersReducer).call,
  TypedReducer<EntityState<int,UserState>,NextUserFollowersSuccessAction>(nextFollowersSuccessReducer).call,
  TypedReducer<EntityState<int,UserState>,NextUserFollowersFailedAction>(nextFollowersFailedReducer).call,
  //followeds
  TypedReducer<EntityState<int,UserState>,NextUserFollowedsAction>(nextFollowedsReducer).call,
  TypedReducer<EntityState<int,UserState>,NextUserFollowedsSuccessAction>(nextFollowedsSuccessReducer).call,
  TypedReducer<EntityState<int,UserState>,NextuserFollowedsFailedAction>(nextFollowedsFailedReducer).call,
  //
  TypedReducer<EntityState<int,UserState>,FollowUserSuccessAction>(followUserSuccessReducer).call,
  TypedReducer<EntityState<int,UserState>,UnfollowUserSuccessAction>(unfollowUserSuccessReducer).call,
  TypedReducer<EntityState<int,UserState>,RemoveFollowerSuccessAction>(removeFollowerSuccessReducer).call,

  TypedReducer<EntityState<int,UserState>,UpdateUserNameSuccessAction>(updateUserNameReducer).call,
  TypedReducer<EntityState<int,UserState>,UpdateNameSuccessAction>(updateNameReducer).call,
  TypedReducer<EntityState<int,UserState>,UpdateBiographySuccessAction>(updateBiographyReducer).call,

  TypedReducer<EntityState<int,UserState>,UploadUserImageAction>(uploadUserImageReducer).call,
  TypedReducer<EntityState<int,UserState>,UploadUserImageSuccessAction>(uploadUserImageSuccessReducer).call,
  TypedReducer<EntityState<int,UserState>,UploadUserImageFailedAction>(uploadUserImageFailedReducer).call,
  TypedReducer<EntityState<int,UserState>,RemoveUserImageSuccessAction>(remvoeUserImageReducer).call,
  TypedReducer<EntityState<int,UserState>,ChangeUserImageRateAction>(changeUserImageRateReducer).call,
]);