import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/users_state/action.dart';
import 'package:my_social_app/state/app_state/users_state/users_state.dart';
import 'package:redux/redux.dart';

//questions
UsersState createQuestionSuccessReducer(UsersState prev, CreateQuestionSuccessAction action) =>
  prev.createQuestion(action.question);
//questions

UsersState loadUserByIdReducer(UsersState prev, LoadUserByIdAction action) =>
  prev.loadUsersById(action.id);
UsersState loadUserByIdSuccessReducer(UsersState prev, LoadUserByIdSuccessAction action) =>
  prev.successUsersById(action.user);
UsersState loadUserByIdFailedReducer(UsersState prev, LoadUserByIdFailedAction action) =>
  prev.failedUsersById(action.id);
UsersState userNotFoundByIdReducer(UsersState prev, UserNotFoundByIdAction action) =>
  prev.notFoundUsersById(action.id);

UsersState loadUserByUserNameReducer(UsersState prev, LoadUserByUserNameAction action) =>
  prev.loadUsersByUserName(action.userName);
UsersState loadUserByUserNameSuccessReducer(UsersState prev, LoadUserByUserNameSuccessAction action) =>
  prev.successUsersByUserName(action.user);
UsersState loadUserByUserNameFailedReducer(UsersState prev, LoadUserByUserNameFailedAction action) =>
  prev.failedUsersByUserName(action.userName);
UsersState userNotFoundByUserNameReducer(UsersState prev, UserNotFoundByUserNameAction action) =>
  prev.notFoundUsersByUserName(action.userName);

//follows
UsersState followSuccessReducer(UsersState prev, FollowSuccessAction action) =>
  prev.follow(action.follower, action.followed, action.followId);

UsersState unfollowSuccessReducer(UsersState prev, UnfollowSuccessAction action) =>
  prev.unfollow(action.follower, action.followed);

UsersState nextFollewersReducer(UsersState prev, NextFollowersAction action) =>
  prev.startLoadingNextFollowers(action.userId);
UsersState nextFollewersSuccessReducer(UsersState prev, NextFollowersSuccessAction action) =>
  prev.addNextFollowers(action.userId,action.followers);
UsersState nextFollewersFailedReducer(UsersState prev, NextFollowersFailedAction action) =>
  prev.stopLoadingNextFollowers(action.userId);

UsersState refreshFollewersReducer(UsersState prev, RefreshFollowersAction action) =>
  prev.startLoadingNextFollowers(action.userId);
UsersState refreshFollewersSuccessReducer(UsersState prev, RefreshFollowersSuccessAction action) =>
  prev.refreshFollowers(action.userId,action.followers);
UsersState refreshFollewersFailedReducer(UsersState prev, RefreshFollowersFailedAction action) =>
  prev.stopLoadingNextFollowers(action.userId);

UsersState nextFollewedsReducer(UsersState prev, NextFollowedsAction action) =>
  prev.startLoadingNextFolloweds(action.userId);
UsersState nextFollewedsSuccessReducer(UsersState prev, NextFollowedsSuccessAction action) =>
  prev.addNextFolloweds(action.userId,action.followeds);
UsersState nextFollewedsFailedReducer(UsersState prev, NextFollowedsFailedAction action) =>
  prev.stopLoadingNextFolloweds(action.userId);

UsersState refreshFollewedsReducer(UsersState prev, RefreshFollowedsAction action) =>
  prev.startLoadingNextFolloweds(action.userId);
UsersState refreshFollewedsSuccessReducer(UsersState prev, RefreshFollowedsSuccessAction action) =>
  prev.refreshFollowers(action.userId,action.followeds);
UsersState refreshFollewedsFailedReducer(UsersState prev, RefreshFollowedsFailedAction action) =>
  prev.stopLoadingNextFolloweds(action.userId);
//follows

Reducer<UsersState> usersReducer = combineReducers<UsersState>([
  //quesitons
  TypedReducer<UsersState,CreateQuestionSuccessAction>(createQuestionSuccessReducer).call,
  //quesitons

  TypedReducer<UsersState,LoadUserByIdAction>(loadUserByIdReducer).call,
  TypedReducer<UsersState,LoadUserByIdSuccessAction>(loadUserByIdSuccessReducer).call,
  TypedReducer<UsersState,LoadUserByIdFailedAction>(loadUserByIdFailedReducer).call,
  TypedReducer<UsersState,UserNotFoundByIdAction>(userNotFoundByIdReducer).call,

  TypedReducer<UsersState,LoadUserByUserNameAction>(loadUserByUserNameReducer).call,
  TypedReducer<UsersState,LoadUserByUserNameSuccessAction>(loadUserByUserNameSuccessReducer).call,
  TypedReducer<UsersState,LoadUserByUserNameFailedAction>(loadUserByUserNameFailedReducer).call,
  TypedReducer<UsersState,UserNotFoundByUserNameAction>(userNotFoundByUserNameReducer).call,

  //follows
  TypedReducer<UsersState,FollowSuccessAction>(followSuccessReducer).call,
  TypedReducer<UsersState,UnfollowSuccessAction>(unfollowSuccessReducer).call,
  
  TypedReducer<UsersState,NextFollowersAction>(nextFollewersReducer).call,
  TypedReducer<UsersState,NextFollowersSuccessAction>(nextFollewersSuccessReducer).call,
  TypedReducer<UsersState,NextFollowersFailedAction>(nextFollewersFailedReducer).call,

  TypedReducer<UsersState,RefreshFollowersAction>(refreshFollewersReducer).call,
  TypedReducer<UsersState,RefreshFollowersSuccessAction>(refreshFollewersSuccessReducer).call,
  TypedReducer<UsersState,RefreshFollowersFailedAction>(refreshFollewersFailedReducer).call,

  TypedReducer<UsersState,NextFollowedsAction>(nextFollewedsReducer).call,
  TypedReducer<UsersState,NextFollowedsSuccessAction>(nextFollewedsSuccessReducer).call,
  TypedReducer<UsersState,NextFollowedsFailedAction>(nextFollewedsFailedReducer).call,

  TypedReducer<UsersState,RefreshFollowedsAction>(refreshFollewedsReducer).call,
  TypedReducer<UsersState,RefreshFollowedsSuccessAction>(refreshFollewedsSuccessReducer).call,
  TypedReducer<UsersState,RefreshFollowedsFailedAction>(refreshFollewedsFailedReducer).call,
  //follows
]);