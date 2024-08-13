import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_entity_state.dart';
import 'package:redux/redux.dart';

UserEntityState getNextPageQuestionsReducer(UserEntityState prev,GetNextPageUserQuestionsAction action)
  => prev.getNextPageQuestions(action.userId);
UserEntityState addNextPageQuestionsReducer(UserEntityState prev,AddNextPageUserQuestionsAction action)
  => prev.addNextPageQuestions(action.userId,action.questionIds);

UserEntityState getNextPageFollowers(UserEntityState prev,GetNextPageUserFollowersAction action)
  => prev.getNextPageFollowers(action.userId);
UserEntityState addNextPageFollowers(UserEntityState prev,AddNextPageUserFollowersAction action)
  => prev.addNextPageFollowers(action.userId,action.userIds);

UserEntityState getNextPageFollowedsReducer(UserEntityState prev,GetNextPageUserFollowedsAction action)
  => prev.getNextPageFolloweds(action.userId);
UserEntityState addNextPageFollowedsReducer(UserEntityState prev,AddNextPageUserFollowedsAction action)
  => prev.addNextPageFolloweds(action.userId,action.userIds);

UserEntityState addMessageReducer(UserEntityState prev,AddUserMessageAction action)
  => prev.addMessage(action.userId, action.messageId);
UserEntityState getNextPageMessagesReducer(UserEntityState prev,GetNextPageUserMessagesAction action)
  => prev.getNextPageMessages(action.userId);
UserEntityState addNextPageUserMessagesReducer(UserEntityState prev,AddNextPageUserMessagesAction action)
  => prev.addNextPageMessages(action.userId, action.messageIds);

UserEntityState loadUserReducer(UserEntityState prev,AddUserAction action)
  => prev.addUser(action.user);
UserEntityState addUsersReducer(UserEntityState prev,AddUsersAction action)
  => prev.addUsers(action.users);

UserEntityState makeFollowRequestReducer(UserEntityState prev, MakeFollowRequestSuccessAction action)
  => prev.makeFollowRequest(action.currentUserId, action.userId);
UserEntityState cancelFollowRequestReducer(UserEntityState prev, CancelFollowRequestSuccessAction action)
  => prev.cancelFollowRequest(action.currentUserId, action.userId);
UserEntityState addQuestionReducer(UserEntityState prev, AddUserQuestionAction action)
  => prev.addQuestion(action.userId, action.questionId);

UserEntityState changeProfileImageStatusReducer(UserEntityState prev,ChangeProfileImageStatusAction action)
  => prev.changeProfileImageStatus(action.userId,action.value);
UserEntityState updateUserNameReducer(UserEntityState prev,UpdateUserNameSuccessAction action)
  => prev.updateUserName(action.userId, action.userName);
UserEntityState updateNameReducer(UserEntityState prev,UpdateNameSuccessAction action)
  => prev.updateName(action.userId, action.name);

Reducer<UserEntityState> userEntityStateReducers = combineReducers<UserEntityState>([
  TypedReducer<UserEntityState,GetNextPageUserQuestionsAction>(getNextPageQuestionsReducer).call,
  TypedReducer<UserEntityState,AddNextPageUserQuestionsAction>(addNextPageQuestionsReducer).call,

  TypedReducer<UserEntityState,GetNextPageUserFollowersAction>(getNextPageFollowers).call,
  TypedReducer<UserEntityState,AddNextPageUserFollowersAction>(addNextPageFollowers).call,

  TypedReducer<UserEntityState,GetNextPageUserFollowedsAction>(getNextPageFollowedsReducer).call,
  TypedReducer<UserEntityState,AddNextPageUserFollowedsAction>(addNextPageFollowedsReducer).call,

  TypedReducer<UserEntityState,AddUserMessageAction>(addMessageReducer).call,
  TypedReducer<UserEntityState,GetNextPageUserMessagesAction>(getNextPageMessagesReducer).call,
  TypedReducer<UserEntityState,AddNextPageUserMessagesAction>(addNextPageUserMessagesReducer).call,

  TypedReducer<UserEntityState,AddUserAction>(loadUserReducer).call,
  TypedReducer<UserEntityState,AddUsersAction>(addUsersReducer).call,
  TypedReducer<UserEntityState,MakeFollowRequestSuccessAction>(makeFollowRequestReducer).call,
  TypedReducer<UserEntityState,CancelFollowRequestSuccessAction>(cancelFollowRequestReducer).call,
  TypedReducer<UserEntityState,AddUserQuestionAction>(addQuestionReducer).call,

  TypedReducer<UserEntityState,ChangeProfileImageStatusAction>(changeProfileImageStatusReducer).call,
  TypedReducer<UserEntityState,UpdateUserNameSuccessAction>(updateUserNameReducer).call,
  TypedReducer<UserEntityState,UpdateNameSuccessAction>(updateNameReducer).call,
]);