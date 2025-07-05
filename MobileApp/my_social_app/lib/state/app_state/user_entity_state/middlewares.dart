import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/services/follow_service.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/services/notification_hub.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/app_state/login_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

void loadUserMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadUserAction){
    if(store.state.userEntityState.getValue(action.userId) == null){
      UserService()
        .getById(action.userId)
        .then((user) => store.dispatch(AddUserAction(user: user.toUserState())));
    }
  }
  next(action);
}
void loadUserByUserNameMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadUserByUserNameAction){
    final user = store.state.userEntityState.get((e) => e.userName == action.userName);
    if(user == null){
      UserService()
        .getByUserName(action.userName)
        .then((user) => store.dispatch(AddUserAction(user: user.toUserState())));
    }
  }
  next(action);
}

void followMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is FollowUserAction){
    FollowService()
      .follow(action.followedId)
      .then((response){
        store.dispatch(FollowUserSuccessAction(
          currentUserId: store.state.login.login!.id,
          followedId: action.followedId,
          followId: response.id
        ));
      });
  }
  next(action);
}
void unfollowMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UnfollowUserAction){
    FollowService()
      .unfollow(action.followedId)
      .then((_) => store.dispatch(UnfollowUserSuccessAction(
        currentUserId: store.state.login.login!.id,
        followedId: action.followedId
      )));
  }
  next(action);
}
void removeFollowerMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RemoveFollowerAction){
    FollowService()
      .removeFollower(action.followerId)
      .then((_) => store.dispatch(RemoveFollowerSuccessAction(currentUserId: store.state.login.login!.id,followerId: action.followerId)));
  }
  next(action);
}

void updateUserNameMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UpdateUserNameAction){
    UserService()
      .updateUserName(action.userName)
      .then((response){
        store.dispatch(UpdateUserNameSuccessAction(userId: store.state.login.login!.id, userName: action.userName));
        store.dispatch(UpdateRefreshTokenAction(refreshToken: response.refreshToken));
        AppClient().changeAccessToken(response.accessToken);
        MessageHub.init(response.accessToken, store);
        NotificationHub.init(response.accessToken, store);
        ToastCreator.displaySuccess(userNameUpdatedNotificationContent[getLanguageByStore(store)]!);
      });
  }
  next(action);
}
void updateNameMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UpdateNameAction){
    UserService()
      .updateName(action.name)
      .then((response){
        store.dispatch(UpdateNameSuccessAction(userId: store.state.login.login!.id, name: action.name));
        store.dispatch(UpdateRefreshTokenAction(refreshToken: response.refreshToken));
        AppClient().changeAccessToken(response.accessToken);
        MessageHub.init(response.accessToken, store);
        NotificationHub.init(response.accessToken, store);
        ToastCreator.displaySuccess(nameUpdatedNotificationContent[getLanguageByStore(store)]!);
      });
  }
  next(action);
}
void updateBiographyMidleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UpdateBiographyAction){
    final accountId = store.state.login.login!.id;
    UserService()
      .updateBiography(action.biography)
      .then((_){
        store.dispatch(UpdateBiographySuccessAction(userId: accountId, biography: action.biography));
        ToastCreator.displaySuccess(biographyUpdatedNotificationContent[getLanguageByStore(store)]!);
      });
  }
  next(action);
}
void uploadUserImageMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is UploadUserImageAction){
    UserService()
      .updateImage(
        action.image,
        action.userId,
        (rate) => store.dispatch(ChangeUserImageRateAction(userId: action.userId, rate: rate))
      )
      .then((response){
        store.dispatch(UploadUserImageSuccessAction(userId: action.userId, image: response.image));
        store.dispatch(UpdateRefreshTokenAction(refreshToken: response.refreshToken));
        AppClient().changeAccessToken(response.accessToken);
        MessageHub.init(response.accessToken, store);
        NotificationHub.init(response.accessToken, store);
      })
      .catchError((e){
        store.dispatch(UploadUserImageFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
void removeUserImageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RemoveUserImageAction){
    UserService()
      .removeImage(action.userId)
      .then((response){
        store.dispatch(RemoveUserImageSuccessAction(userId: action.userId));
        store.dispatch(UpdateRefreshTokenAction(refreshToken: response.refreshToken));
        AppClient().changeAccessToken(response.accessToken);
        MessageHub.init(response.accessToken, store);
        NotificationHub.init(response.accessToken, store);
      });
  }
  next(action);
}

void nextUserFollowersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextUserFollowersAction){
    final pagination = store.state.userEntityState.getValue(action.userId)!.followers;
    FollowService()
      .getFollowersByUserId(action.userId, pagination.next)
      .then((followers) => store.dispatch(NextUserFollowersSuccessAction(userId: action.userId,followers: followers.map((e) => e.toFollowState()))))
      .catchError((e){
        store.dispatch(NextUserFollowersFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
void nextUserFollowedsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextUserFollowedsAction){
    final pagination = store.state.userEntityState.getValue(action.userId)!.followeds;
    FollowService()
      .getFollowedsByUserId(action.userId,pagination.next)
      .then((followeds) => store.dispatch(NextUserFollowedsSuccessAction(userId: action.userId,followeds: followeds.map((e) => e.toFollowState()))))
      .catchError((e){
        store.dispatch(NextuserFollowedsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}

