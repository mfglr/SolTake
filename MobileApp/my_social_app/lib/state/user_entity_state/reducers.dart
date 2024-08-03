import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_entity_state.dart';
import 'package:redux/redux.dart';

UserEntityState loadUserReducer(UserEntityState oldState,LoadUserSuccessAction action)
  => oldState.addUser(action.user);
UserEntityState loadUsersReducer(UserEntityState oldState,AddUsersAction action)
  => oldState.addUsers(action.users);
UserEntityState loadFollowersReducer(UserEntityState oldState,Action action)
  => action is LoadFollowersSuccessAction ? oldState.addFollowers(action.userId,action.payload) : oldState;
UserEntityState loadFollowedsSuccessReducer(UserEntityState oldState,Action action)
  => action is LoadFollowedsSuccessAction ? oldState.addFolloweds(action.userId,action.payload) : oldState;
UserEntityState nextPageOfUserQuestionsSuccessReducer(UserEntityState oldState,Action action)
  => action is NextPageOfUserQuestionsSuccessAction ? oldState.addQuestions(action.userId,action.payload) : oldState;
UserEntityState makeFollowRequestReducer(UserEntityState oldState, Action action)
  => action is MakeFollowRequestSuccessAction ? oldState.makeFollowRequest(action.currentUserId, action.userId) : oldState;
UserEntityState cancelFollowRequestReducer(UserEntityState oldState, Action action)
  => action is CancelFollowRequestSuccessAction ? oldState.cancelFollowRequest(action.currentUserId, action.userId) : oldState;
UserEntityState addQuestionReducer(UserEntityState oldState, Action action)
  => action is AddUserQuestionAction ? oldState.addQuestion(action.userId, action.questionId) : oldState;
UserEntityState addUserMessageReducer(UserEntityState prev,AddUserMessageAction action)
  => prev.addUserMessage(action.userId, action.messageId);

Reducer<UserEntityState> userEntityStateReducers = combineReducers<UserEntityState>([
  TypedReducer<UserEntityState,LoadUserSuccessAction>(loadUserReducer).call,
  TypedReducer<UserEntityState,AddUsersAction>(loadUsersReducer).call,
  TypedReducer<UserEntityState,LoadFollowersSuccessAction>(loadFollowersReducer).call,
  TypedReducer<UserEntityState,LoadFollowedsSuccessAction>(loadFollowedsSuccessReducer).call,
  TypedReducer<UserEntityState,NextPageOfUserQuestionsSuccessAction>(nextPageOfUserQuestionsSuccessReducer).call,
  TypedReducer<UserEntityState,MakeFollowRequestSuccessAction>(makeFollowRequestReducer).call,
  TypedReducer<UserEntityState,CancelFollowRequestSuccessAction>(cancelFollowRequestReducer).call,
  TypedReducer<UserEntityState,AddUserQuestionAction>(addQuestionReducer).call,
  TypedReducer<UserEntityState,AddUserMessageAction>(addUserMessageReducer).call,
]);