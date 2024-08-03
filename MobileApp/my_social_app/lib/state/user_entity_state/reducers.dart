import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_entity_state.dart';
import 'package:redux/redux.dart';

UserEntityState loadUserReducer(UserEntityState oldState,LoadUserSuccessAction action)
  => oldState.addUser(action.user);

UserEntityState addUsersReducer(UserEntityState oldState,AddUsersAction action)
  => oldState.addUsers(action.users);

UserEntityState loadFollowersReducer(UserEntityState oldState,LoadFollowersSuccessAction action)
  => oldState.addFollowers(action.userId,action.payload);

UserEntityState loadFollowedsSuccessReducer(UserEntityState oldState,LoadFollowedsSuccessAction action)
  => oldState.addFolloweds(action.userId,action.payload);

UserEntityState nextPageOfUserQuestionsSuccessReducer(UserEntityState oldState,NextPageOfUserQuestionsSuccessAction action)
  => oldState.addQuestions(action.userId,action.payload);

UserEntityState makeFollowRequestReducer(UserEntityState oldState, MakeFollowRequestSuccessAction action)
  => oldState.makeFollowRequest(action.currentUserId, action.userId);

UserEntityState cancelFollowRequestReducer(UserEntityState oldState, CancelFollowRequestSuccessAction action)
  => oldState.cancelFollowRequest(action.currentUserId, action.userId);

UserEntityState addQuestionReducer(UserEntityState oldState, AddUserQuestionAction action)
  => oldState.addQuestion(action.userId, action.questionId);

UserEntityState nextPageUserMessagesReducer(UserEntityState prev,NextPageUserMessagesSuccessAction action)
  => prev.nextPageUserMessages(action.userId, action.messages);

Reducer<UserEntityState> userEntityStateReducers = combineReducers<UserEntityState>([
  TypedReducer<UserEntityState,LoadUserSuccessAction>(loadUserReducer).call,
  TypedReducer<UserEntityState,AddUsersAction>(addUsersReducer).call,
  TypedReducer<UserEntityState,LoadFollowersSuccessAction>(loadFollowersReducer).call,
  TypedReducer<UserEntityState,LoadFollowedsSuccessAction>(loadFollowedsSuccessReducer).call,
  TypedReducer<UserEntityState,NextPageOfUserQuestionsSuccessAction>(nextPageOfUserQuestionsSuccessReducer).call,
  TypedReducer<UserEntityState,MakeFollowRequestSuccessAction>(makeFollowRequestReducer).call,
  TypedReducer<UserEntityState,CancelFollowRequestSuccessAction>(cancelFollowRequestReducer).call,
  TypedReducer<UserEntityState,AddUserQuestionAction>(addQuestionReducer).call,
  TypedReducer<UserEntityState,NextPageUserMessagesSuccessAction>(nextPageUserMessagesReducer).call,
]);