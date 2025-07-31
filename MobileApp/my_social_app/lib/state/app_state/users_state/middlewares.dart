import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/services/follow_service.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/users_state/action.dart';
import 'package:my_social_app/state/app_state/users_state/selectors.dart';
import 'package:redux/redux.dart';

void loadUserByIdMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is LoadUserByIdAction){
    UserService()
      .getById(action.id)
      .then((user) => store.dispatch(LoadUserByIdSuccessAction(user: user.toUserState())))
      .catchError((e){
        if(e is BackendException){
          if(e.statusCode == 404){
            store.dispatch(UserNotFoundByIdAction(id: action.id));
          }
          else{
            store.dispatch(LoadUserByIdFailedAction(id: action.id));
          }
        }
        throw e;
      });
  }
  next(action);
}
void loadUserByUserNameMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is LoadUserByUserNameAction){
    UserService()
      .getByUserName(action.userName)
      .then((user) => store.dispatch(LoadUserByUserNameSuccessAction(user: user.toUserState())))
      .catchError((e){
        if(e is BackendException){
          if(e.statusCode == 404){
            store.dispatch(UserNotFoundByUserNameAction(userName: action.userName));
          }
          else{
            store.dispatch(LoadUserByUserNameFailedAction(userName: action.userName));
          }
        }
        throw e;
      });
  }
  next(action);
}

void followMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is FollowAction){
    final follower = selectUserById(store, store.state.login.login!.id).entity!;
    FollowService()
      .follow(action.followed.id)
      .then((response) => store.dispatch(FollowSuccessAction(
        follower: follower,
        followed: action.followed,
        followId: response.id
      )));
  }
  next(action);
}

void unfollowMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is UnfollowAction){
    final follower = selectUserById(store, store.state.login.login!.id).entity!;
    FollowService()
      .unfollow(action.followed.id)
      .then((response) => store.dispatch(UnfollowSuccessAction(
        follower: follower,
        followed: action.followed,
      )));
  }
  next(action);
}

void nextFollowersMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextFollowersAction){
    FollowService()
      .getFollowersByUserId(action.userId, selectFollowers(store, action.userId).next)
      .then((followers) => store.dispatch(NextFollowersSuccessAction(
        userId: action.userId,
        followers: followers.map((e) => e.toFollowState())
      )));
  }
  next(action);
}
void refreshFollowersMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshFollowersAction){
    FollowService()
      .getFollowersByUserId(action.userId, selectFollowers(store, action.userId).first)
      .then((followers) => store.dispatch(RefreshFollowersSuccessAction(
        userId: action.userId,
        followers: followers.map((e) => e.toFollowState())
      )));
  }
  next(action);
}

void nextFollowedsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextFollowedsAction){
    FollowService()
      .getFollowedsByUserId(action.userId, selectFolloweds(store, action.userId).next)
      .then((followeds) => store.dispatch(NextFollowedsSuccessAction(
        userId: action.userId,
        followeds: followeds.map((e) => e.toFollowState())
      )));
  }
  next(action);
}
void refreshFollowedsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshFollowedsAction){
    FollowService()
      .getFollowedsByUserId(action.userId, selectFolloweds(store, action.userId).first)
      .then((followeds) => store.dispatch(RefreshFollowedsSuccessAction(
        userId: action.userId,
        followeds: followeds.map((e) => e.toFollowState())
      )));
  }
  next(action);
}