import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';

@immutable
class UserEntityState extends EntityState<UserState>{
  const UserEntityState({required super.entities});

  UserEntityState addUser(UserState value)
    => UserEntityState(entities: appendOne(value));
  UserEntityState addUsers(Iterable<UserState> values)
    => UserEntityState(entities: appendMany(values));

  UserEntityState follow(int currentUserId, int followedId, int followId) =>
    UserEntityState(entities: updateMany([
      entities[currentUserId]?.addFollowedToCurrentUser(followId),
      entities[followedId]?.addFollower(followId)
    ]));
  UserEntityState unfollow(int currentUserId, int followedId, int followId) =>
    UserEntityState(entities: updateMany([
      entities[currentUserId]?.removeFollowedToCurrentUser(followId),
      entities[followedId]?.removeFollower(followId)
    ]));
  UserEntityState removeFollower(int currentUserId,int followerId, int followId) =>
    UserEntityState(entities: updateMany([
      entities[currentUserId]?.removeFollowerToCurrentUser(followId),
      entities[followerId]?.removeFollowed(followId)
    ]));
  UserEntityState addNewFollower(int currentUserId,int followerId,int followId) =>
    UserEntityState(entities: updateMany([
      entities[currentUserId]?.addFollowerToCurrentUser(followId),
      entities[followerId]?.addFollowed(followId)
    ]));

  //followers
  UserEntityState startLoadingNextFollowers(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.startLoadingNextFollowers()));
  UserEntityState addNextPageFollowers(int userId, Iterable<int> followIds)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextFollowers(followIds)));
  UserEntityState stopLoadingNextFollowers(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.stopLoadingNextFollowers()));

  //foloweds
  UserEntityState startLoadingNextFolloweds(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.startLoadingNextFolloweds()));
  UserEntityState addNextPageFolloweds(int userId, Iterable<int> ids)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextFolloweds(ids)));
  UserEntityState stopLoadingNextFolloweds(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.stopLoadingNextFolloweds()));

  //not followeds
  UserEntityState getNextPageNotFolloweds(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.getNextPageNotFolloweds()));
  UserEntityState addNextPageNotFolloweds(int userId,Iterable<int> ids)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextPageNotFolloweds(ids)));
  UserEntityState addNotFollowed(int userId,int id)
    => UserEntityState(entities: updateOne(entities[userId]?.addNotFollowed(id)));
  UserEntityState removeNotFollowed(int userId,int id)
    => UserEntityState(entities: updateOne(entities[userId]?.removeNotFollowed(id)));

  //
  UserEntityState markQuestionAsSolved(int userId,int id)
    => UserEntityState(entities: updateOne(entities[userId]?.markQuestionAsSolved(id)));
  UserEntityState markQuestionAsUnsolved(int userId,int id)
    => UserEntityState(entities: updateOne(entities[userId]?.markQuestionAsUnsolved(id)));

  //questions
  UserEntityState startLoadingNextQuestions(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.startLoadingNextQuestions()));
  UserEntityState stopLoadingNextQuestions(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.stopLoadingNextQuestion()));
  UserEntityState addNextQuestions(int userId, Iterable<int> ids)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextPageQuestions(ids)));

  UserEntityState addNewQuestion(int userId,int id)
    => UserEntityState(entities: updateOne(entities[userId]?.addNewQuestion(id)));
  UserEntityState removeQuestion(int userId,int questionId)
    => UserEntityState(entities: updateOne(entities[userId]?.removeQuestion(questionId)));

  //solved questions
  UserEntityState startLoadingNextSolvedQuestions(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.startLoadingNextSolvedQuestions()));
  UserEntityState stopLoadingNextSolvedQuestions(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.stopLoadingNextSolvedQuestions()));
  UserEntityState addNextSolvedQuestions(int userId, Iterable<int> ids)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextSolvedQuestions(ids)));
  
  //unsolved questions
  UserEntityState startLoadingNextUnsolvedQuestions(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.startLoadingNextUnsolvedQuestions()));
  UserEntityState addNextUnsolvedQuestions(int userId,Iterable<int> ids)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextUnsolvedQuestions(ids)));
  UserEntityState stopLoadingNextUnsolvedQuestions(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.stopLoadingNextUnsolvedQuestion()));
    
  //saved questions
  UserEntityState startLoadingNextSavedQuestions(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.startLoadingNextSavedQuestions()));
  UserEntityState addNextPageSavedQuestions(int userId,Iterable<int> saveIds)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextSavedQuestions(saveIds)));
  UserEntityState stopLoadingNextSavedQuestions(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.stopLoadingNextSavedQuestions()));

  UserEntityState addSavedQuestion(int userId, int saveId)
    => UserEntityState(entities: updateOne(entities[userId]?.addSavedQuestion(saveId)));
  UserEntityState removeSavedQuestion(int userId, int saveId)
    => UserEntityState(entities: updateOne(entities[userId]?.removeSavedQuestion(saveId)));

  //saved solutions
  UserEntityState startLoadingSavedSolutions(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.startLoadingSavedSolutions()));
  UserEntityState addNextPageSolutions(int userId,Iterable<int> saveIds)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextSavedSolutions(saveIds)));
  UserEntityState stopLoadingSavedSolution(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.stopLoadingSavedSolutions()));

  UserEntityState addSavedSolution(int userId, int saveId)
    => UserEntityState(entities: updateOne(entities[userId]?.addSavedSolution(saveId)));
  UserEntityState removeSavedSolution(int userId,int saveId)
    => UserEntityState(entities: updateOne(entities[userId]?.removeSavedSolution(saveId)));

  //messages
  UserEntityState startLoadingNextMessages(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.startLoadingNextMessages()));
  UserEntityState addNextMessages(int userId,Iterable<int> messageIds)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextMessages(messageIds)));
  UserEntityState stopLoadingNextMessages(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.stopLoadingNextMessages()));

  UserEntityState addMessage(int userId,int messageId)
    => UserEntityState(entities: updateOne(entities[userId]?.addMessage(messageId)));
  UserEntityState removeMessage(int userId,int messageId)
    => UserEntityState(entities: updateOne(entities[userId]?.removeMessage(messageId)));
  UserEntityState removeMessages(int userId,Iterable<int> messageIds)
    => UserEntityState(entities: updateOne(entities[userId]?.removeMessages(messageIds)));

  //conversations
  UserEntityState startLoadingNextConversations(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.startLoadingNextConversations()));
  UserEntityState addNextConversations(int userId,Iterable<int> ids)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextConversations(ids)));
  UserEntityState stopLoadingNextConversations(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.stopLoadingNextConversations()));

  UserEntityState addConversation(int userId,int id)
    => UserEntityState(entities: updateOne(entities[userId]?.addConversation(id)));
  UserEntityState addConversationInOrder(int userId, int id)
    => UserEntityState(entities: updateOne(entities[userId]?.addConversationInOrder(id)));
  UserEntityState removeConversation(int userId,int id)
    => UserEntityState(entities: updateOne(entities[userId]?.removeConversation(id)));

  UserEntityState changeProfileImageStatus(int userId,bool value)
    => UserEntityState(entities: updateOne(entities[userId]?.changeProfileImageStatus(value)));
  UserEntityState updateUserName(int userId,String userName)
    => UserEntityState(entities: updateOne(entities[userId]?.updateUserName(userName)));
  UserEntityState updateName(int userId,String name)
    => UserEntityState(entities: updateOne(entities[userId]?.updateName(name)));
  UserEntityState updateBiography(int userId,String biography)
    => UserEntityState(entities: updateOne(entities[userId]?.updateBiography(biography)));
  UserEntityState updateImage(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.updateImage()));
  UserEntityState removeImage(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.removeImage()));
}