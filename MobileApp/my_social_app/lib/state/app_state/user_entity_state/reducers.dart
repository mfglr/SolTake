import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_entity_state.dart';
import 'package:redux/redux.dart';

UserEntityState markQuestionAsSolvedReducer(UserEntityState prev,MarkUserQuestionAsSolvedAction action)
  => prev.markQuestionAsSolved(action.userId, action.questionId);
UserEntityState markQuestionAsUnsolvedReducer(UserEntityState prev,MarkUserQuestionAsUnsolvedAction action)
  => prev.markQuestionAsUnsolved(action.userId, action.questionId);

//questions
UserEntityState nextQuestionsReducer(UserEntityState prev,NextUserQuestionsAction action)
  => prev.startLoadingNextQuestions(action.userId);
UserEntityState nextQuestionsSuccessReducer(UserEntityState prev,NextUserQuestionsSuccessAction action)
  => prev.addNextQuestions(action.userId,action.questionIds);
UserEntityState nextQuestionFailedReducer(UserEntityState prev,NextUserQuestionsFailedAction action)
  => prev.stopLoadingNextQuestions(action.userId);

UserEntityState addNewQuestionReducer(UserEntityState prev, AddNewUserQuestionAction action)
  => prev.addNewQuestion(action.userId, action.questionId);
UserEntityState removeQuestionReducer(UserEntityState prev, RemoveUserQuestionAction action)
  => prev.removeQuestion(action.userId,action.questionId);

//solved questions
UserEntityState nextSolvedQuestionsReducer(UserEntityState prev, NextUserSolvedQuestionsAction action) 
  => prev.startLoadingNextSolvedQuestions(action.userId);
UserEntityState nextSolvedQuestionsSuccessReducer(UserEntityState prev, NextUserSolvedQuestionsSuccessAction action)
  => prev.addNextSolvedQuestions(action.userId,action.questionIds);
UserEntityState nextSolvedQuestionsFailedReducer(UserEntityState prev, NextUserSolvedQuestionsFailedAction action)
  => prev.stopLoadingNextSolvedQuestions(action.userId);

//unsolved questions
UserEntityState nextUnsolvedQuestionsReducer(UserEntityState prev, NextUserUnsolvedQuestionsAction action)
  => prev.startLoadingNextUnsolvedQuestions(action.userId);
UserEntityState nextUnsolvedQuestionsSuccessReducer(UserEntityState prev, NextUserUnsolvedQuestionsSuccessAction action)
  => prev.addNextUnsolvedQuestions(action.userId, action.questionIds);
UserEntityState nextUnsolvedQuestionsFailedReducer(UserEntityState prev, NextUserUnsolvedQuestionsFailedAction action)
  => prev.stopLoadingNextUnsolvedQuestions(action.userId);

//saved questions
UserEntityState nextSavedQuestionsReducer(UserEntityState prev,NextUserSavedQuestionsAction action)
  => prev.startLoadingNextSavedQuestions(action.userId);
UserEntityState nextSavedQuestionsSuccessReducer(UserEntityState prev,NextUserSavedQuestionsSuccessAction action)
  => prev.addNextPageSavedQuestions(action.userId,action.savedIds);
UserEntityState nextSavedQuestionsFailedReducer(UserEntityState prev,NextUserSavedQuestionsFailedAction action)
  => prev.stopLoadingNextSavedQuestions(action.userId);

UserEntityState addSavedQuestionReducer(UserEntityState prev,AddUserSavedQuestionAction action)
  => prev.addSavedQuestion(action.userId,action.saveId);
UserEntityState removeSavedQuestionReducer(UserEntityState prev,RemoveUserSavedQuestionAction action)
  => prev.removeSavedQuestion(action.userId,action.saveId);

//saved solutions
UserEntityState nextSavedSolutionsReducer(UserEntityState prev, NextUserSavedSolutionsAction action)
  => prev.startLoadingSavedSolutions(action.userId);
UserEntityState nextSavedSolutionsSuccessReducer(UserEntityState prev, NextUserSavedSolutionsSuccessAction action)
  => prev.addNextPageSolutions(action.userId,action.savedIds);
UserEntityState nextSavedSolutionsFailedReducer(UserEntityState prev, NextUserSavedSolutionsFailedAction action)
  => prev.stopLoadingSavedSolution(action.userId);

UserEntityState addSavedSolutionReducer(UserEntityState prev, AddUserSavedSolutionAction action)
  => prev.addSavedSolution(action.userId, action.saveId);
UserEntityState removeSavedSolutionReducer(UserEntityState prev, RemoveUserSavedSolutionAction action)
  => prev.removeSavedSolution(action.userId, action.saveId);

//followers
UserEntityState nextFollowersReducer(UserEntityState prev,NextUserFollowersAction action)
  => prev.startLoadingNextFollowers(action.userId);
UserEntityState nextFollowersSuccessReducer(UserEntityState prev,NextUserFollowersSuccessAction action)
  => prev.addNextPageFollowers(action.userId,action.followIds);
UserEntityState nextFollowersFailedReducer(UserEntityState prev,NextUserFollowersFailedAction action)
  => prev.stopLoadingNextFollowers(action.userId);

//followeds
UserEntityState nextFollowedsReducer(UserEntityState prev,NextUserFollowedsAction action)
  => prev.startLoadingNextFolloweds(action.userId);
UserEntityState nextFollowedsSuccessReducer(UserEntityState prev,NextUserFollowedsSuccessAction action)
  => prev.addNextPageFolloweds(action.userId,action.followIds);
UserEntityState nextFollowedsFailedReducer(UserEntityState prev,NextuserFollowedsFailedAction action)
  => prev.stopLoadingNextFolloweds(action.userId);

UserEntityState followReducer(UserEntityState prev,FollowUserSuccessAction action)
  => prev.follow(action.currentUserId, action.followedId, action.followId);
UserEntityState unfollowReducer(UserEntityState prev,UnfollowUserSuccessAction action)
  => prev.unfollow(action.currentUserId, action.followedId, action.followId);
UserEntityState removeFollowerReducer(UserEntityState prev,RemoveFollowerSuccessAction action)
  => prev.removeFollower(action.currentUserId, action.followerId, action.followId);
UserEntityState addNewFollowerReducer(UserEntityState prev,AddNewFollowerAction action)
  => prev.addNewFollower(action.curentUserId, action.followerId, action.followId);

// not followeds
UserEntityState getNextPageNotFollowedsReducer(UserEntityState prev,GetNextPageUserNotFollowedsAction action)
  => prev.getNextPageNotFolloweds(action.userId);
UserEntityState addNextPageNotFollowedsReducer(UserEntityState prev,AddNextPageUserNotFollowedsAction action)
  => prev.addNextPageNotFolloweds(action.userId, action.userIds);
UserEntityState addNotFollowedReducer(UserEntityState prev,AddUserNotFollowedAction action)
  => prev.addNotFollowed(action.userId,action.notFollowedId);
UserEntityState removeNotFollowedReducer(UserEntityState prev,RemoveUserNotFollowedAction action)
  => prev.removeNotFollowed(action.userId,action.notFollowedId);

//messages
UserEntityState nextMessagesReducer(UserEntityState prev,NextUserMessagesAction action)
  => prev.startLoadingNextMessages(action.userId);
UserEntityState nextMessagesSuccessReducer(UserEntityState prev,NextUserMessagesSuccessAction action)
  => prev.addNextMessages(action.userId, action.messageIds);
UserEntityState nextMessagesFailedReducer(UserEntityState prev,NextUserMessagesFailedAction action)
  => prev.stopLoadingNextMessages(action.userId);

UserEntityState addMessageReducer(UserEntityState prev,AddUserMessageAction action)
  => prev.addMessage(action.userId, action.messageId);
UserEntityState removeMessageReducer(UserEntityState prev,RemoveUserMessageAction action)
  => prev.removeMessage(action.userId, action.messageId);
UserEntityState removeMessagesReducer(UserEntityState prev,RemoveUserMessagesAction action)
  => prev.removeMessages(action.userId, action.messageIds);

//conversations
UserEntityState nextConversationsReducer(UserEntityState prev,NextUserConversationsAction action)
  => prev.startLoadingNextConversations(action.userId);
UserEntityState nextConversationsSuccessReducer(UserEntityState prev,NextUserConversationsSuccessAction action)
  => prev.addNextConversations(action.userId,action.ids);
UserEntityState nextConversationsFailedRedcer(UserEntityState prev,NextUserConversationsFailedAction action)
 => prev.stopLoadingNextConversations(action.userId);

UserEntityState addConversationReducer(UserEntityState prev, AddUserConversationAction action)
  => prev.addConversation(action.userId,action.id);
UserEntityState addConversationInOrderReducer(UserEntityState prev,AddUserConversationInOrderAction action)
  => prev.addConversationInOrder(action.userId, action.id);
UserEntityState removeConversationReducer(UserEntityState prev, RemoveUserConversationAction action)
  => prev.removeConversation(action.userId, action.id);

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
UserEntityState updateBiographyReducer(UserEntityState prev, UpdateBiographySuccessAction action)
  => prev.updateBiography(action.userId, action.biography);

UserEntityState addMessageToCacheReducer(UserEntityState prev, AddMessageToCacheAction action)
  => prev.addMessageToCache(action.userId,action.message);
UserEntityState removeMessageToCacheReducer(UserEntityState prev, RemoveMessageToCacheAction action)
  => prev.removeMessageToCache(action.userId,action.message);

Reducer<UserEntityState> userEntityStateReducers = combineReducers<UserEntityState>([
  //
  TypedReducer<UserEntityState,MarkUserQuestionAsSolvedAction>(markQuestionAsSolvedReducer).call,
  TypedReducer<UserEntityState,MarkUserQuestionAsUnsolvedAction>(markQuestionAsUnsolvedReducer).call,
  TypedReducer<UserEntityState,AddNewUserQuestionAction>(addNewQuestionReducer).call,
  TypedReducer<UserEntityState,RemoveUserQuestionAction>(removeQuestionReducer).call,

  //questions
  TypedReducer<UserEntityState,NextUserQuestionsAction>(nextQuestionsReducer).call,
  TypedReducer<UserEntityState,NextUserQuestionsSuccessAction>(nextQuestionsSuccessReducer).call,
  TypedReducer<UserEntityState,NextUserQuestionsFailedAction>(nextQuestionFailedReducer).call,

  //solved questions
  TypedReducer<UserEntityState,NextUserSolvedQuestionsAction>(nextSolvedQuestionsReducer).call,
  TypedReducer<UserEntityState,NextUserSolvedQuestionsSuccessAction>(nextSolvedQuestionsSuccessReducer).call,
  TypedReducer<UserEntityState,NextUserSolvedQuestionsFailedAction>(nextSolvedQuestionsFailedReducer).call,

  //unsolved questions
  TypedReducer<UserEntityState,NextUserUnsolvedQuestionsAction>(nextUnsolvedQuestionsReducer).call,
  TypedReducer<UserEntityState,NextUserUnsolvedQuestionsSuccessAction>(nextUnsolvedQuestionsSuccessReducer).call,
  TypedReducer<UserEntityState,NextUserUnsolvedQuestionsFailedAction>(nextUnsolvedQuestionsFailedReducer).call,

  //saved questions
  TypedReducer<UserEntityState,NextUserSavedQuestionsAction>(nextSavedQuestionsReducer).call,
  TypedReducer<UserEntityState,NextUserSavedQuestionsSuccessAction>(nextSavedQuestionsSuccessReducer).call,
  TypedReducer<UserEntityState,NextUserSavedQuestionsFailedAction>(nextSavedQuestionsFailedReducer).call,

  TypedReducer<UserEntityState,AddUserSavedQuestionAction>(addSavedQuestionReducer).call,
  TypedReducer<UserEntityState,RemoveUserSavedQuestionAction>(removeSavedQuestionReducer).call,

  //saved solutions
  TypedReducer<UserEntityState,NextUserSavedSolutionsAction>(nextSavedSolutionsReducer).call,
  TypedReducer<UserEntityState,NextUserSavedSolutionsSuccessAction>(nextSavedSolutionsSuccessReducer).call,
  TypedReducer<UserEntityState,NextUserSavedSolutionsFailedAction>(nextSavedSolutionsFailedReducer).call,

  TypedReducer<UserEntityState,AddUserSavedSolutionAction>(addSavedSolutionReducer).call,
  TypedReducer<UserEntityState,RemoveUserSavedSolutionAction>(removeSavedSolutionReducer).call,

  //followers
  TypedReducer<UserEntityState,NextUserFollowersAction>(nextFollowersReducer).call,
  TypedReducer<UserEntityState,NextUserFollowersSuccessAction>(nextFollowersSuccessReducer).call,
  TypedReducer<UserEntityState,NextUserFollowersFailedAction>(nextFollowersFailedReducer).call,

  //followeds
  TypedReducer<UserEntityState,NextUserFollowedsAction>(nextFollowedsReducer).call,
  TypedReducer<UserEntityState,NextUserFollowedsSuccessAction>(nextFollowedsSuccessReducer).call,
  TypedReducer<UserEntityState,NextuserFollowedsFailedAction>(nextFollowedsFailedReducer).call,
  
  TypedReducer<UserEntityState,FollowUserSuccessAction>(followReducer).call,
  TypedReducer<UserEntityState,UnfollowUserSuccessAction>(unfollowReducer).call,
  TypedReducer<UserEntityState,RemoveFollowerSuccessAction>(removeFollowerReducer).call,
  TypedReducer<UserEntityState,AddNewFollowerAction>(addNewFollowerReducer).call,

  //not followeds
  TypedReducer<UserEntityState,GetNextPageUserNotFollowedsAction>(getNextPageNotFollowedsReducer).call,
  TypedReducer<UserEntityState,AddNextPageUserNotFollowedsAction>(addNextPageNotFollowedsReducer).call,
  TypedReducer<UserEntityState,RemoveUserNotFollowedAction>(removeNotFollowedReducer).call,
  TypedReducer<UserEntityState,AddUserNotFollowedAction>(addNotFollowedReducer).call,

  //messages
  TypedReducer<UserEntityState,NextUserMessagesAction>(nextMessagesReducer).call,
  TypedReducer<UserEntityState,NextUserMessagesSuccessAction>(nextMessagesSuccessReducer).call,
  TypedReducer<UserEntityState,NextUserMessagesFailedAction>(nextMessagesFailedReducer).call,

  TypedReducer<UserEntityState,AddUserMessageAction>(addMessageReducer).call,
  
  TypedReducer<UserEntityState,RemoveUserMessageAction>(removeMessageReducer).call,
  TypedReducer<UserEntityState,RemoveUserMessagesAction>(removeMessagesReducer).call,

  //conversations
  TypedReducer<UserEntityState,NextUserConversationsAction>(nextConversationsReducer).call,
  TypedReducer<UserEntityState,NextUserConversationsSuccessAction>(nextConversationsSuccessReducer).call,
  TypedReducer<UserEntityState,NextUserConversationsFailedAction>(nextConversationsFailedRedcer).call,

  TypedReducer<UserEntityState,AddUserConversationAction>(addConversationReducer).call,
  TypedReducer<UserEntityState,AddUserConversationInOrderAction>(addConversationInOrderReducer).call,
  TypedReducer<UserEntityState,RemoveUserConversationAction>(removeConversationReducer).call,

  TypedReducer<UserEntityState,AddUserAction>(loadUserReducer).call,
  TypedReducer<UserEntityState,AddUsersAction>(addUsersReducer).call,

  TypedReducer<UserEntityState,ChangeProfileImageStatusAction>(changeProfileImageStatusReducer).call,
  TypedReducer<UserEntityState,UpdateUserNameSuccessAction>(updateUserNameReducer).call,
  TypedReducer<UserEntityState,UpdateNameSuccessAction>(updateNameReducer).call,
  TypedReducer<UserEntityState,UpdateBiographySuccessAction>(updateBiographyReducer).call,

  TypedReducer<UserEntityState,AddMessageToCacheAction>(addMessageToCacheReducer).call,
  TypedReducer<UserEntityState,RemoveMessageToCacheAction>(removeMessageToCacheReducer).call,
]);