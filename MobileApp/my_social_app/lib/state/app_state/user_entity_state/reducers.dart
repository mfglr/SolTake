import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_entity_state.dart';
import 'package:redux/redux.dart';

//questions
UserEntityState getNextPageQuestionsReducer(UserEntityState prev,GetNextPageUserQuestionsAction action)
  => prev.getNextPageQuestions(action.userId);
UserEntityState addNextPageQuestionsReducer(UserEntityState prev,AddNextPageUserQuestionsAction action)
  => prev.addNextPageQuestions(action.userId,action.questionIds);
UserEntityState addQuestionReducer(UserEntityState prev, AddUserQuestionAction action)
  => prev.addQuestion(action.userId, action.questionId);

//solved questions
UserEntityState getNextPageSolvedQuestionsReducer(UserEntityState prev, GetNextPageUserSolvedQuestionsAction action) 
  => prev.getNextPageSolvedQuestions(action.userId);
UserEntityState addNextPageSolvedQuestionsReducer(UserEntityState prev, AddNextPageUserSolvedQuestionsAction action)
  => prev.addNextPageSolvedQuestions(action.userId,action.questionIds);
UserEntityState addSolvedQuestionReducr(UserEntityState prev,AddUserSolvedQuestionAction action)
  => prev.addSolvedQuestion(action.userId, action.questionId);

//unsolved questions
UserEntityState getNextPageUnsolvedQuestionsReducer(UserEntityState prev, GetNextPageUserUnsolvedQuestionsAction action)
  => prev.getNextPageUnsolvedQuestions(action.userId);
UserEntityState addNextPageUnsolvedQuestionsReducer(UserEntityState prev, AddNextPageUserUnsolvedQuestionsAction action)
  => prev.addNextPageUnsolvedQuestions(action.userId, action.questionIds);
UserEntityState addUnsolvedQuestionReducer(UserEntityState prev,AddUserUnsolvedQuestionAction action)
  => prev.addUnsolvedQuestion(action.userId, action.questionId);
UserEntityState removeUnsolvedQuestionReducer(UserEntityState prev,RemoveUserUnsolvedQuestionAction action)
  => prev.removeUnsolveQuestion(action.userId,action.questionId);

//followers
UserEntityState getNextPageFollowers(UserEntityState prev,GetNextPageUserFollowersAction action)
  => prev.getNextPageFollowers(action.userId);
UserEntityState addNextPageFollowers(UserEntityState prev,AddNextPageUserFollowersAction action)
  => prev.addNextPageFollowers(action.userId,action.userIds);
UserEntityState addFollowerReducer(UserEntityState prev, AddFollowerAction action)
  => prev.addFollower(action.userId, action.followerId);
UserEntityState removeFollowerReducer(UserEntityState prev, RemoveFollowerAction action)
  => prev.removeFollower(action.userId,action.followerId);

//followeds
UserEntityState getNextPageFollowedsReducer(UserEntityState prev,GetNextPageUserFollowedsAction action)
  => prev.getNextPageFolloweds(action.userId);
UserEntityState addNextPageFollowedsReducer(UserEntityState prev,AddNextPageUserFollowedsAction action)
  => prev.addNextPageFolloweds(action.userId,action.userIds);
UserEntityState addFollowedReducer(UserEntityState prev,AddFollowedAction action)
  => prev.addFollowed(action.userId, action.followedId);
UserEntityState removeFollowedReducer(UserEntityState prev,RemoveFollowedAction action)
  => prev.removeFollowed(action.userId,action.followedId);

// not followeds
UserEntityState getNextPageNotFollowedsReducer(UserEntityState prev,GetNextPageUserNotFollowedsAction action)
  => prev.getNextPageNotFolloweds(action.userId);
UserEntityState addNextPageNotFollowedsReducer(UserEntityState prev,AddNextPageUserNotFollowedsAction action)
  => prev.addNextPageNotFolloweds(action.userId, action.userIds);
UserEntityState removeNotFollowedReducer(UserEntityState prev,RemoveUserNotFollowedAction action)
  => prev.removeNotFollowed(action.userId,action.notFollowedId);
UserEntityState addNotFollowedReducer(UserEntityState prev,AddUserNotFollowedAction action)
  => prev.addNotFollowed(action.userId,action.notFollowedId);

//messages
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

UserEntityState changeProfileImageStatusReducer(UserEntityState prev,ChangeProfileImageStatusAction action)
  => prev.changeProfileImageStatus(action.userId,action.value);
UserEntityState updateUserNameReducer(UserEntityState prev,UpdateUserNameSuccessAction action)
  => prev.updateUserName(action.userId, action.userName);
UserEntityState updateNameReducer(UserEntityState prev,UpdateNameSuccessAction action)
  => prev.updateName(action.userId, action.name);

Reducer<UserEntityState> userEntityStateReducers = combineReducers<UserEntityState>([
  //questions
  TypedReducer<UserEntityState,GetNextPageUserQuestionsAction>(getNextPageQuestionsReducer).call,
  TypedReducer<UserEntityState,AddNextPageUserQuestionsAction>(addNextPageQuestionsReducer).call,
  TypedReducer<UserEntityState,AddUserQuestionAction>(addQuestionReducer).call,

  //solved questions
  TypedReducer<UserEntityState,GetNextPageUserSolvedQuestionsAction>(getNextPageSolvedQuestionsReducer).call,
  TypedReducer<UserEntityState,AddNextPageUserSolvedQuestionsAction>(addNextPageSolvedQuestionsReducer).call,
  TypedReducer<UserEntityState,AddUserSolvedQuestionAction>(addSolvedQuestionReducr).call,

  //unsolved questions
  TypedReducer<UserEntityState,GetNextPageUserUnsolvedQuestionsAction>(getNextPageUnsolvedQuestionsReducer).call,
  TypedReducer<UserEntityState,AddNextPageUserUnsolvedQuestionsAction>(addNextPageUnsolvedQuestionsReducer).call,
  TypedReducer<UserEntityState,AddUserUnsolvedQuestionAction>(addUnsolvedQuestionReducer).call,
  TypedReducer<UserEntityState,RemoveUserUnsolvedQuestionAction>(removeUnsolvedQuestionReducer).call,

  //followers
  TypedReducer<UserEntityState,GetNextPageUserFollowersAction>(getNextPageFollowers).call,
  TypedReducer<UserEntityState,AddNextPageUserFollowersAction>(addNextPageFollowers).call,
  TypedReducer<UserEntityState,AddFollowerAction>(addFollowerReducer).call,
  TypedReducer<UserEntityState,RemoveFollowerAction>(removeFollowerReducer).call,

  //followeds
  TypedReducer<UserEntityState,GetNextPageUserFollowedsAction>(getNextPageFollowedsReducer).call,
  TypedReducer<UserEntityState,AddNextPageUserFollowedsAction>(addNextPageFollowedsReducer).call,
  TypedReducer<UserEntityState,AddFollowedAction>(addFollowedReducer).call,
  TypedReducer<UserEntityState,RemoveFollowedAction>(removeFollowedReducer).call,

  //not followeds
  TypedReducer<UserEntityState,GetNextPageUserNotFollowedsAction>(getNextPageNotFollowedsReducer).call,
  TypedReducer<UserEntityState,AddNextPageUserNotFollowedsAction>(addNextPageNotFollowedsReducer).call,
  TypedReducer<UserEntityState,RemoveUserNotFollowedAction>(removeNotFollowedReducer).call,
  TypedReducer<UserEntityState,AddUserNotFollowedAction>(addNotFollowedReducer).call,

  TypedReducer<UserEntityState,AddUserMessageAction>(addMessageReducer).call,
  TypedReducer<UserEntityState,GetNextPageUserMessagesAction>(getNextPageMessagesReducer).call,
  TypedReducer<UserEntityState,AddNextPageUserMessagesAction>(addNextPageUserMessagesReducer).call,

  TypedReducer<UserEntityState,AddUserAction>(loadUserReducer).call,
  TypedReducer<UserEntityState,AddUsersAction>(addUsersReducer).call,

  TypedReducer<UserEntityState,ChangeProfileImageStatusAction>(changeProfileImageStatusReducer).call,
  TypedReducer<UserEntityState,UpdateUserNameSuccessAction>(updateUserNameReducer).call,
  TypedReducer<UserEntityState,UpdateNameSuccessAction>(updateNameReducer).call,
]);