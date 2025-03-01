import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/followed_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/follower_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';


EntityState<num,UserState> addUserReducer(EntityState<num,UserState> prev,AddUserAction action)
  => prev.appendOne(action.user);
EntityState<num,UserState> addUsersReducer(EntityState<num,UserState> prev,AddUsersAction action)
  => prev.appendMany(action.users);

//following ************************************* following//

//followers
EntityState<num,UserState> nextFollowersReducer(EntityState<num,UserState> prev,NextUserFollowersAction action)
  => prev.updateOne(prev.getValue(action.userId)!.startLoadingNextFollowers());
EntityState<num,UserState> nextFollowersSuccessReducer(EntityState<num,UserState> prev,NextUserFollowersSuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.addNextFollowers(action.followers));
EntityState<num,UserState> nextFollowersFailedReducer(EntityState<num,UserState> prev,NextUserFollowersFailedAction action)
  => prev.updateOne(prev.getValue(action.userId)!.stopLoadingNextFollowers());

//followeds
EntityState<num,UserState> nextFollowedsReducer(EntityState<num,UserState> prev,NextUserFollowedsAction action)
  => prev.updateOne(prev.getValue(action.userId)!.startLoadingNextFolloweds());
EntityState<num,UserState> nextFollowedsSuccessReducer(EntityState<num,UserState> prev,NextUserFollowedsSuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.addNextFolloweds(action.followeds));
EntityState<num,UserState> nextFollowedsFailedReducer(EntityState<num,UserState> prev,NextuserFollowedsFailedAction action)
  => prev.updateOne(prev.getValue(action.userId)!.stopLoadingNextFolloweds());

EntityState<num,UserState> followUserSuccessReducer(EntityState<num,UserState> prev, FollowUserSuccessAction action){
  var follower = prev.getValue(action.currentUserId)!;
  var followed = prev.getValue(action.followedId)!;
  return prev.updateMany(
    [
      follower.addFollowedToCurrentUser(
        FollowedState(
          id: action.followId,
          followedId: followed.id,
          userName: followed.userName,
          name: followed.name,
          image: followed.image,
          isFollower: followed.isFollower,
          isFollowed: true,
        )
      ),
      followed.addFollower(
        FollowerState(
          id: action.followId,
          followerId: follower.id,
          userName: follower.userName,
          name: follower.name,
          image: follower.image,
          isFollower: false,
          isFollowed: false
        )
      )
    ]
  );
}
EntityState<num,UserState> unfollowUserSuccessReducer(EntityState<num,UserState> prev, UnfollowUserSuccessAction action) =>
  prev.updateMany(
    [
      prev.getValue(action.currentUserId)!.removeFollowedToCurrentUser(action.followedId),
      prev.getValue(action.followedId)!.removeFollower(action.currentUserId)
    ]
  );
EntityState<num,UserState> removeFollowerSuccessReducer(EntityState<num,UserState> prev, RemoveFollowerSuccessAction action) =>
  prev.updateMany(
    [
      prev.getValue(action.followerId)!.removeFollowed(action.currentUserId),
      prev.getValue(action.currentUserId)!.removeFollowerToCurrentUser(action.followerId),
    ]
  );

// EntityState<num,UserState> addNewFollowerReducer(EntityState<num,UserState> prev,AddNewFollowerAction action){
//   var follower = prev.getValue(action.followerId);
//   var followed = prev.getValue(action.curentUserId)!;
//   return prev.updateMany(
//     [
//       follower
//         ?.addFollowed(
//           FollowedState(
//             id: action.followId,
//             followedId: followed.id,
//             userName: followed.userName,
//             name: followed.name,
//             image: followed.image
//           )
//         ),
//         followed.addFollower(
//           FollowerState(
//             id: action.followId,
//             followerId: followerId, userName: userName, name: name, image: image)
//         )
//     ]
//     .where((e) => e != null)
//     .map((e) => e!)
//   );
// }
  

//follow ************************************* follow//


EntityState<num,UserState> markQuestionAsSolvedReducer(EntityState<num,UserState> prev,MarkUserQuestionAsSolvedAction action)
  => prev.updateOne(prev.getValue(action.userId)!.markQuestionAsSolved(action.questionId));
EntityState<num,UserState> markQuestionAsUnsolvedReducer(EntityState<num,UserState> prev,MarkUserQuestionAsUnsolvedAction action)
  => prev.updateOne(prev.getValue(action.userId)!.markQuestionAsUnsolved(action.questionId));

//questions
EntityState<num,UserState> nextQuestionsReducer(EntityState<num,UserState> prev,NextUserQuestionsAction action)
  => prev.updateOne(prev.getValue(action.userId)!.startLoadingNextQuestions());
EntityState<num,UserState> nextQuestionsSuccessReducer(EntityState<num,UserState> prev,NextUserQuestionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.addNextPageQuestions(action.questionIds));
EntityState<num,UserState> nextQuestionFailedReducer(EntityState<num,UserState> prev,NextUserQuestionsFailedAction action)
  => prev.updateOne(prev.getValue(action.userId)!.stopLoadingNextQuestions()) ;

EntityState<num,UserState> addNewQuestionReducer(EntityState<num,UserState> prev, AddNewUserQuestionAction action)
  => prev.updateOne(prev.getValue(action.userId)!.addNewQuestion(action.questionId));
EntityState<num,UserState> removeQuestionReducer(EntityState<num,UserState> prev, RemoveUserQuestionAction action)
  => prev.updateOne(prev.getValue(action.userId)!.removeQuestion(action.questionId));

//solved questions
EntityState<num,UserState> nextSolvedQuestionsReducer(EntityState<num,UserState> prev, NextUserSolvedQuestionsAction action) 
  => prev.updateOne(prev.getValue(action.userId)!.startLoadingNextSolvedQuestions());
EntityState<num,UserState> nextSolvedQuestionsSuccessReducer(EntityState<num,UserState> prev, NextUserSolvedQuestionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.addNextSolvedQuestions(action.questionIds));
EntityState<num,UserState> nextSolvedQuestionsFailedReducer(EntityState<num,UserState> prev, NextUserSolvedQuestionsFailedAction action)
  => prev.updateOne(prev.getValue(action.userId)!.stopLoadingNextSolvedQuestions());

//unsolved questions
EntityState<num,UserState> nextUnsolvedQuestionsReducer(EntityState<num,UserState> prev, NextUserUnsolvedQuestionsAction action)
  => prev.updateOne(prev.getValue(action.userId)!.startLoadingNextUnsolvedQuestions());
EntityState<num,UserState> nextUnsolvedQuestionsSuccessReducer(EntityState<num,UserState> prev, NextUserUnsolvedQuestionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.addNextUnsolvedQuestions(action.questionIds)) ;
EntityState<num,UserState> nextUnsolvedQuestionsFailedReducer(EntityState<num,UserState> prev, NextUserUnsolvedQuestionsFailedAction action)
  => prev.updateOne(prev.getValue(action.userId)!.stopLoadingNextUnsolvedQuestion());

//saved questions
EntityState<num,UserState> nextSavedQuestionsReducer(EntityState<num,UserState> prev,NextUserSavedQuestionsAction action)
  => prev.updateOne(prev.getValue(action.userId)!.startLoadingNextSavedQuestions());
EntityState<num,UserState> nextSavedQuestionsSuccessReducer(EntityState<num,UserState> prev,NextUserSavedQuestionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.addNextSavedQuestions(action.savedIds));
EntityState<num,UserState> nextSavedQuestionsFailedReducer(EntityState<num,UserState> prev,NextUserSavedQuestionsFailedAction action)
  => prev.updateOne(prev.getValue(action.userId)!.stopLoadingNextSavedQuestions());

EntityState<num,UserState> addSavedQuestionReducer(EntityState<num,UserState> prev,AddUserSavedQuestionAction action)
  => prev.updateOne(prev.getValue(action.userId)!.addSavedQuestion(action.saveId));
EntityState<num,UserState> removeSavedQuestionReducer(EntityState<num,UserState> prev,RemoveUserSavedQuestionAction action)
  => prev.updateOne(prev.getValue(action.userId)!.removeSavedQuestion(action.saveId)) ;

//saved solutions
EntityState<num,UserState> nextSavedSolutionsReducer(EntityState<num,UserState> prev, NextUserSavedSolutionsAction action)
  => prev.updateOne(prev.getValue(action.userId)!.startLoadingSavedSolutions());
EntityState<num,UserState> nextSavedSolutionsSuccessReducer(EntityState<num,UserState> prev, NextUserSavedSolutionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.addNextSavedSolutions(action.savedIds)) ;
EntityState<num,UserState> nextSavedSolutionsFailedReducer(EntityState<num,UserState> prev, NextUserSavedSolutionsFailedAction action)
  => prev.updateOne(prev.getValue(action.userId)!.stopLoadingSavedSolutions());

EntityState<num,UserState> addSavedSolutionReducer(EntityState<num,UserState> prev, AddUserSavedSolutionAction action)
  => prev.updateOne(prev.getValue(action.userId)!.addSavedSolution(action.saveId));
EntityState<num,UserState> removeSavedSolutionReducer(EntityState<num,UserState> prev, RemoveUserSavedSolutionAction action)
  => prev.updateOne(prev.getValue(action.userId)!.removeSavedSolution(action.saveId));


// //messages
// EntityState<num,UserState> nextMessagesReducer(EntityState<num,UserState> prev,NextUserMessagesAction action)
//   => prev.startLoadingNextMessages(action.userId);
// EntityState<num,UserState> nextMessagesSuccessReducer(EntityState<num,UserState> prev,NextUserMessagesSuccessAction action)
//   => prev.addNextMessages(action.userId, action.messageIds);
// EntityState<num,UserState> nextMessagesFailedReducer(EntityState<num,UserState> prev,NextUserMessagesFailedAction action)
//   => prev.stopLoadingNextMessages(action.userId);

// EntityState<num,UserState> addMessageReducer(EntityState<num,UserState> prev,AddUserMessageAction action)
//   => prev.addMessage(action.userId, action.messageId);
// EntityState<num,UserState> removeMessageReducer(EntityState<num,UserState> prev,RemoveUserMessageAction action)
//   => prev.removeMessage(action.userId, action.messageId);
// EntityState<num,UserState> removeMessagesReducer(EntityState<num,UserState> prev,RemoveUserMessagesAction action)
//   => prev.removeMessages(action.userId, action.messageIds);

// //conversations
// EntityState<num,UserState> nextConversationsReducer(EntityState<num,UserState> prev,NextUserConversationsAction action)
//   => prev.startLoadingNextConversations(action.userId);
// EntityState<num,UserState> nextConversationsSuccessReducer(EntityState<num,UserState> prev,NextUserConversationsSuccessAction action)
//   => prev.addNextConversations(action.userId,action.ids);
// EntityState<num,UserState> nextConversationsFailedRedcer(EntityState<num,UserState> prev,NextUserConversationsFailedAction action)
//  => prev.stopLoadingNextConversations(action.userId);

// EntityState<num,UserState> addConversationReducer(EntityState<num,UserState> prev, AddUserConversationAction action)
//   => prev.addConversation(action.userId,action.id);
// EntityState<num,UserState> addConversationInOrderReducer(EntityState<num,UserState> prev,AddUserConversationInOrderAction action)
//   => prev.addConversationInOrder(action.userId, action.id);
// EntityState<num,UserState> removeConversationReducer(EntityState<num,UserState> prev, RemoveUserConversationAction action)
//   => prev.removeConversation(action.userId, action.id);

// EntityState<num,UserState> updateUserNameReducer(EntityState<num,UserState> prev,UpdateUserNameSuccessAction action)
//   => prev.updateUserName(action.userId, action.userName);
// EntityState<num,UserState> updateNameReducer(EntityState<num,UserState> prev,UpdateNameSuccessAction action)
//   => prev.updateName(action.userId, action.name);
// EntityState<num,UserState> updateBiographyReducer(EntityState<num,UserState> prev, UpdateBiographySuccessAction action)
//   => prev.updateBiography(action.userId, action.biography);

// EntityState<num,UserState> uploadUserImageReducer(EntityState<num,UserState> prev,UploadUserImageAction action)
//   => prev.uploadImage(action.userId,action.image);
// EntityState<num,UserState> uploadUserImageSuccessReducer(EntityState<num,UserState> prev,UploadUserImageSuccessAction action)
//   => prev.uploadImageSuccess(action.userId, action.image);
// EntityState<num,UserState> uploadUserImageFailedReducer(EntityState<num,UserState> prev,UploadUserImageFailedAction action)
//   => prev.uploadImageFailed(action.userId);
// EntityState<num,UserState> remvoeUserImageReducer(EntityState<num,UserState> prev, RemoveUserImageSuccessAction action)
//   => prev.removeImage(action.userId);
// EntityState<num,UserState> changeUserImageRateReducer(EntityState<num,UserState> prev, ChangeUserImageRateAction action)
//   => prev.changeImageRate(action.userId,action.rate);


Reducer<EntityState<num,UserState>> userEntityStateReducers = combineReducers<EntityState<num,UserState>>([
  TypedReducer<EntityState<num,UserState>,AddUserAction>(addUserReducer).call,
  TypedReducer<EntityState<num,UserState>,AddUsersAction>(addUsersReducer).call,

  //followers
  TypedReducer<EntityState<num,UserState>,NextUserFollowersAction>(nextFollowersReducer).call,
  TypedReducer<EntityState<num,UserState>,NextUserFollowersSuccessAction>(nextFollowersSuccessReducer).call,
  TypedReducer<EntityState<num,UserState>,NextUserFollowersFailedAction>(nextFollowersFailedReducer).call,
  //followeds
  TypedReducer<EntityState<num,UserState>,NextUserFollowedsAction>(nextFollowedsReducer).call,
  TypedReducer<EntityState<num,UserState>,NextUserFollowedsSuccessAction>(nextFollowedsSuccessReducer).call,
  TypedReducer<EntityState<num,UserState>,NextuserFollowedsFailedAction>(nextFollowedsFailedReducer).call,
  //
  TypedReducer<EntityState<num,UserState>,FollowUserSuccessAction>(followUserSuccessReducer).call,
  TypedReducer<EntityState<num,UserState>,UnfollowUserSuccessAction>(unfollowUserSuccessReducer).call,
  TypedReducer<EntityState<num,UserState>,RemoveFollowerSuccessAction>(removeFollowerSuccessReducer).call,
  // TypedReducer<EntityState<num,UserState>,AddNewFollowerAction>(addNewFollowerSuccessReducer).call,
  
  //
  TypedReducer<EntityState<num,UserState>,MarkUserQuestionAsSolvedAction>(markQuestionAsSolvedReducer).call,
  TypedReducer<EntityState<num,UserState>,MarkUserQuestionAsUnsolvedAction>(markQuestionAsUnsolvedReducer).call,
  TypedReducer<EntityState<num,UserState>,AddNewUserQuestionAction>(addNewQuestionReducer).call,
  TypedReducer<EntityState<num,UserState>,RemoveUserQuestionAction>(removeQuestionReducer).call,

  //questions
  TypedReducer<EntityState<num,UserState>,NextUserQuestionsAction>(nextQuestionsReducer).call,
  TypedReducer<EntityState<num,UserState>,NextUserQuestionsSuccessAction>(nextQuestionsSuccessReducer).call,
  TypedReducer<EntityState<num,UserState>,NextUserQuestionsFailedAction>(nextQuestionFailedReducer).call,

  //solved questions
  TypedReducer<EntityState<num,UserState>,NextUserSolvedQuestionsAction>(nextSolvedQuestionsReducer).call,
  TypedReducer<EntityState<num,UserState>,NextUserSolvedQuestionsSuccessAction>(nextSolvedQuestionsSuccessReducer).call,
  TypedReducer<EntityState<num,UserState>,NextUserSolvedQuestionsFailedAction>(nextSolvedQuestionsFailedReducer).call,

  //unsolved questions
  TypedReducer<EntityState<num,UserState>,NextUserUnsolvedQuestionsAction>(nextUnsolvedQuestionsReducer).call,
  TypedReducer<EntityState<num,UserState>,NextUserUnsolvedQuestionsSuccessAction>(nextUnsolvedQuestionsSuccessReducer).call,
  TypedReducer<EntityState<num,UserState>,NextUserUnsolvedQuestionsFailedAction>(nextUnsolvedQuestionsFailedReducer).call,

  //saved questions
  TypedReducer<EntityState<num,UserState>,NextUserSavedQuestionsAction>(nextSavedQuestionsReducer).call,
  TypedReducer<EntityState<num,UserState>,NextUserSavedQuestionsSuccessAction>(nextSavedQuestionsSuccessReducer).call,
  TypedReducer<EntityState<num,UserState>,NextUserSavedQuestionsFailedAction>(nextSavedQuestionsFailedReducer).call,

  TypedReducer<EntityState<num,UserState>,AddUserSavedQuestionAction>(addSavedQuestionReducer).call,
  TypedReducer<EntityState<num,UserState>,RemoveUserSavedQuestionAction>(removeSavedQuestionReducer).call,

  //saved solutions
  TypedReducer<EntityState<num,UserState>,NextUserSavedSolutionsAction>(nextSavedSolutionsReducer).call,
  TypedReducer<EntityState<num,UserState>,NextUserSavedSolutionsSuccessAction>(nextSavedSolutionsSuccessReducer).call,
  TypedReducer<EntityState<num,UserState>,NextUserSavedSolutionsFailedAction>(nextSavedSolutionsFailedReducer).call,

  TypedReducer<EntityState<num,UserState>,AddUserSavedSolutionAction>(addSavedSolutionReducer).call,
  TypedReducer<EntityState<num,UserState>,RemoveUserSavedSolutionAction>(removeSavedSolutionReducer).call,
  
  // //messages
  // TypedReducer<EntityState<num,UserState>,NextUserMessagesAction>(nextMessagesReducer).call,
  // TypedReducer<EntityState<num,UserState>,NextUserMessagesSuccessAction>(nextMessagesSuccessReducer).call,
  // TypedReducer<EntityState<num,UserState>,NextUserMessagesFailedAction>(nextMessagesFailedReducer).call,

  // TypedReducer<EntityState<num,UserState>,AddUserMessageAction>(addMessageReducer).call,
  
  // TypedReducer<EntityState<num,UserState>,RemoveUserMessageAction>(removeMessageReducer).call,
  // TypedReducer<EntityState<num,UserState>,RemoveUserMessagesAction>(removeMessagesReducer).call,

  // //conversations
  // TypedReducer<EntityState<num,UserState>,NextUserConversationsAction>(nextConversationsReducer).call,
  // TypedReducer<EntityState<num,UserState>,NextUserConversationsSuccessAction>(nextConversationsSuccessReducer).call,
  // TypedReducer<EntityState<num,UserState>,NextUserConversationsFailedAction>(nextConversationsFailedRedcer).call,

  // TypedReducer<EntityState<num,UserState>,AddUserConversationAction>(addConversationReducer).call,
  // TypedReducer<EntityState<num,UserState>,AddUserConversationInOrderAction>(addConversationInOrderReducer).call,
  // TypedReducer<EntityState<num,UserState>,RemoveUserConversationAction>(removeConversationReducer).call,

  

  // TypedReducer<EntityState<num,UserState>,UpdateUserNameSuccessAction>(updateUserNameReducer).call,
  // TypedReducer<EntityState<num,UserState>,UpdateNameSuccessAction>(updateNameReducer).call,
  // TypedReducer<EntityState<num,UserState>,UpdateBiographySuccessAction>(updateBiographyReducer).call,

  // TypedReducer<EntityState<num,UserState>,UploadUserImageAction>(uploadUserImageReducer).call,
  // TypedReducer<EntityState<num,UserState>,UploadUserImageSuccessAction>(uploadUserImageSuccessReducer).call,
  // TypedReducer<EntityState<num,UserState>,UploadUserImageFailedAction>(uploadUserImageFailedReducer).call,
  // TypedReducer<EntityState<num,UserState>,RemoveUserImageSuccessAction>(remvoeUserImageReducer).call,
  // TypedReducer<EntityState<num,UserState>,ChangeUserImageRateAction>(changeUserImageRateReducer).call,
]);