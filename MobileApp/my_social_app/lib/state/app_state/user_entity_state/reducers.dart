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
UserEntityState getNextPageUnsolvedQuestionsReducer(UserEntityState prev, GetNextPageUserUnsolvedQuestionsAction action)
  => prev.getNextPageUnsolvedQuestions(action.userId);
UserEntityState addNextPageUnsolvedQuestionsReducer(UserEntityState prev, AddNextPageUserUnsolvedQuestionsAction action)
  => prev.addNextPageUnsolvedQuestions(action.userId, action.questionIds);

//saved questions
UserEntityState getNextPageSavedQuestionsReducer(UserEntityState prev,GetNextPageUserSavedQuestionsAction action)
  => prev.getNextPageSavedQuestions(action.userId);
UserEntityState addNextPageSavedQuestionsReducer(UserEntityState prev,AddNextPageUserSavedQuestionsAction action)
  => prev.addNextPageSavedQuestions(action.userId,action.savedIds);
UserEntityState addSavedQuestionReducer(UserEntityState prev,AddUserSavedQuestionAction action)
  => prev.addSavedQuestion(action.userId,action.saveId);
UserEntityState removeSavedQuestionReducer(UserEntityState prev,RemoveUserSavedQuestionAction action)
  => prev.removeSavedQuestion(action.userId,action.saveId);

//saved solutions
UserEntityState getNextPageSavedSolutionsReducer(UserEntityState prev, GetNextPageUserSavedSolutionsAction action)
  => prev.getNextPageSavedSolutions(action.userId);
UserEntityState addNextPageSavedSolutionsReducer(UserEntityState prev, AddNextPageUserSavedSolutionsAction action)
  => prev.addNextPageSavedSolutions(action.userId,action.savedIds);
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
UserEntityState getNextPageConversationReducer(UserEntityState prev,GetNextPageUserConversationAction action)
  => prev.getNextPageConversations(action.userId);
UserEntityState addNextPageConversationReducer(UserEntityState prev,AddNextPageUserConversationsAction action)
  => prev.addNextPageConversations(action.userId,action.ids);
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
  TypedReducer<UserEntityState,GetNextPageUserUnsolvedQuestionsAction>(getNextPageUnsolvedQuestionsReducer).call,
  TypedReducer<UserEntityState,AddNextPageUserUnsolvedQuestionsAction>(addNextPageUnsolvedQuestionsReducer).call,

  //saved questions
  TypedReducer<UserEntityState,GetNextPageUserSavedQuestionsAction>(getNextPageSavedQuestionsReducer).call,
  TypedReducer<UserEntityState,AddNextPageUserSavedQuestionsAction>(addNextPageSavedQuestionsReducer).call,
  TypedReducer<UserEntityState,AddUserSavedQuestionAction>(addSavedQuestionReducer).call,
  TypedReducer<UserEntityState,RemoveUserSavedQuestionAction>(removeSavedQuestionReducer).call,

  //saved solutions
  TypedReducer<UserEntityState,GetNextPageUserSavedSolutionsAction>(getNextPageSavedSolutionsReducer).call,
  TypedReducer<UserEntityState,AddNextPageUserSavedSolutionsAction>(addNextPageSavedSolutionsReducer).call,
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
  TypedReducer<UserEntityState,GetNextPageUserConversationAction>(getNextPageConversationReducer).call,
  TypedReducer<UserEntityState,AddNextPageUserConversationsAction>(addNextPageConversationReducer).call,
  TypedReducer<UserEntityState,AddUserConversationAction>(addConversationReducer).call,
  TypedReducer<UserEntityState,AddUserConversationInOrderAction>(addConversationInOrderReducer).call,
  TypedReducer<UserEntityState,RemoveUserConversationAction>(removeConversationReducer).call,

  TypedReducer<UserEntityState,AddUserAction>(loadUserReducer).call,
  TypedReducer<UserEntityState,AddUsersAction>(addUsersReducer).call,

  TypedReducer<UserEntityState,ChangeProfileImageStatusAction>(changeProfileImageStatusReducer).call,
  TypedReducer<UserEntityState,UpdateUserNameSuccessAction>(updateUserNameReducer).call,
  TypedReducer<UserEntityState,UpdateNameSuccessAction>(updateNameReducer).call,
  TypedReducer<UserEntityState,UpdateBiographySuccessAction>(updateBiographyReducer).call,
]);