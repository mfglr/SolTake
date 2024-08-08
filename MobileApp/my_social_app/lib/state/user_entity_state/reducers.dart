import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_entity_state.dart';
import 'package:redux/redux.dart';


UserEntityState getNextPageQuestionsReducer(UserEntityState prev,GetNextPageUserQuestionsAction action)
  => prev.getNextPageQuestions(action.userId);
UserEntityState addNextPageQuestionsReducer(UserEntityState prev,AddNextPageUserQuestionsAction action)
  => prev.addNextPageQuestions(action.userId,action.userIds);

UserEntityState loadUserReducer(UserEntityState prev,LoadUserSuccessAction action)
  => prev.addUser(action.user);

UserEntityState addUsersReducer(UserEntityState prev,AddUsersAction action)
  => prev.addUsers(action.users);

UserEntityState loadFollowersReducer(UserEntityState prev,LoadFollowersSuccessAction action)
  => prev.addFollowers(action.userId,action.payload);

UserEntityState loadFollowedsSuccessReducer(UserEntityState prev,LoadFollowedsSuccessAction action)
  => prev.addFolloweds(action.userId,action.payload);


UserEntityState makeFollowRequestReducer(UserEntityState prev, MakeFollowRequestSuccessAction action)
  => prev.makeFollowRequest(action.currentUserId, action.userId);

UserEntityState cancelFollowRequestReducer(UserEntityState prev, CancelFollowRequestSuccessAction action)
  => prev.cancelFollowRequest(action.currentUserId, action.userId);

UserEntityState addQuestionReducer(UserEntityState prev, AddUserQuestionAction action)
  => prev.addQuestion(action.userId, action.questionId);

UserEntityState nextPageUserMessagesReducer(UserEntityState prev,NextPageUserMessagesSuccessAction action)
  => prev.nextPageUserMessages(action.userId, action.messages);

Reducer<UserEntityState> userEntityStateReducers = combineReducers<UserEntityState>([
  TypedReducer<UserEntityState,AddNextPageUserQuestionsAction>(addNextPageQuestionsReducer).call,

  TypedReducer<UserEntityState,LoadUserSuccessAction>(loadUserReducer).call,
  TypedReducer<UserEntityState,AddUsersAction>(addUsersReducer).call,
  TypedReducer<UserEntityState,LoadFollowersSuccessAction>(loadFollowersReducer).call,
  TypedReducer<UserEntityState,LoadFollowedsSuccessAction>(loadFollowedsSuccessReducer).call,
  TypedReducer<UserEntityState,MakeFollowRequestSuccessAction>(makeFollowRequestReducer).call,
  TypedReducer<UserEntityState,CancelFollowRequestSuccessAction>(cancelFollowRequestReducer).call,
  TypedReducer<UserEntityState,AddUserQuestionAction>(addQuestionReducer).call,
  TypedReducer<UserEntityState,NextPageUserMessagesSuccessAction>(nextPageUserMessagesReducer).call,
]);