import 'package:my_social_app/state/app_state/follows_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/users_state/action.dart';
import 'package:my_social_app/state/app_state/users_state/users_state.dart';
import 'package:redux/redux.dart';

//questions
UsersState createQuestionSuccessReducer(UsersState prev, CreateQuestionSuccessAction action) =>
  prev.createQuestion(action.question);
UsersState deleteQuestionSuccessReducer(UsersState prev, DeleteQuestionSuccessAction action) =>
  prev.deleteQuestion(action.question);
//questions

//users
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
//users

//follows
UsersState followSuccessReducer(UsersState prev, FollowSuccessAction action) =>
  prev.follow(action.follower, action.followed, action.followId);
UsersState unfollowSuccessReducer(UsersState prev, UnfollowSuccessAction action) =>
  prev.unfollow(action.follower, action.followed);
//follows

UsersState updateNameSuccessReducer(UsersState prev, UpdateNameSuccessAction action) =>
  prev.updateName(action.userId, action.name);
UsersState updateUserNameSuccessReducer(UsersState prev, UpdateUserNameSuccessAction action) =>
  prev.updateUserName(action.userId, action.userName);
UsersState updateUserBiographySuccessReducer(UsersState prev, UpdateUserBiographySuccessAction action) =>
  prev.updateBiography(action.userId, action.biography);

Reducer<UsersState> usersReducer = combineReducers<UsersState>([
  //quesitons
  TypedReducer<UsersState,CreateQuestionSuccessAction>(createQuestionSuccessReducer).call,
  TypedReducer<UsersState,DeleteQuestionSuccessAction>(deleteQuestionSuccessReducer).call,
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
  //follows

  TypedReducer<UsersState,UpdateNameSuccessAction>(updateNameSuccessReducer).call,
  TypedReducer<UsersState,UpdateUserNameSuccessAction>(updateUserNameSuccessReducer).call,
  TypedReducer<UsersState,UpdateUserBiographySuccessAction>(updateUserBiographySuccessReducer).call,
]);