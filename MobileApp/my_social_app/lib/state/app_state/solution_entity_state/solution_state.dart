import 'dart:typed_data';

import 'package:my_social_app/state/app_state/pagination.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_image_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_status.dart';

class SolutionState{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int questionId;
  final int appUserId;
  final String userName;
  final String? content;
  final bool isUpvoted;
  final int numberOfUpvotes;
  final bool isDownvoted;
  final int numberOfDownvotes;
  final bool belongsToQuestionOfCurrentUser;
  final bool isOwner;
  final Iterable<SolutionImageState> images;
  final int numberOfComments;
  final Pagination comments;
  final int state;

  const SolutionState({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.questionId,
    required this.appUserId,
    required this.userName,
    required this.content,
    required this.isUpvoted,
    required this.numberOfUpvotes,
    required this.isDownvoted,
    required this.numberOfDownvotes,
    required this.belongsToQuestionOfCurrentUser,
    required this.isOwner,
    required this.images,
    required this.numberOfComments,
    required this.comments,
    required this.state
  });

  String formatUserName(int count)
    => userName.length <= count ? userName : "${userName.substring(0,10)}...";

  SolutionState makeUpvote()
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        appUserId: appUserId,
        userName: userName,
        content: content,
        isUpvoted: true,
        numberOfUpvotes: numberOfUpvotes + 1,
        isDownvoted: false,
        numberOfDownvotes: isDownvoted ? numberOfDownvotes - 1 : numberOfDownvotes,
        belongsToQuestionOfCurrentUser: belongsToQuestionOfCurrentUser,
        isOwner: isOwner,
        images: images,
        numberOfComments: numberOfComments,
        comments: comments,
        state: state,
      );
  SolutionState makeDownvote()
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        appUserId: appUserId,
        userName: userName,
        content: content,
        isUpvoted: false,
        numberOfUpvotes: isUpvoted ? numberOfUpvotes - 1 : numberOfUpvotes,
        isDownvoted: true,
        numberOfDownvotes: numberOfDownvotes + 1,
        belongsToQuestionOfCurrentUser: belongsToQuestionOfCurrentUser,
        isOwner: isOwner,
        images: images,
        numberOfComments: numberOfComments,
        comments: comments,
        state: state,
      );
  SolutionState removeUpvote()
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        appUserId: appUserId,
        userName: userName,
        content: content,
        isUpvoted: false,
        numberOfUpvotes: numberOfUpvotes - 1,
        isDownvoted: isDownvoted,
        numberOfDownvotes: numberOfDownvotes,
        belongsToQuestionOfCurrentUser: belongsToQuestionOfCurrentUser,
        isOwner: isOwner,
        images: images,
        numberOfComments: numberOfComments,
        comments: comments,
        state: state,
      );
  SolutionState removeDownvote()
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        appUserId: appUserId,
        userName: userName,
        content: content,
        isUpvoted: isUpvoted,
        numberOfUpvotes: numberOfUpvotes,
        isDownvoted: false,
        numberOfDownvotes: numberOfDownvotes - 1,
        belongsToQuestionOfCurrentUser: belongsToQuestionOfCurrentUser,
        isOwner: isOwner,
        images: images,
        numberOfComments: numberOfComments,
        comments: comments,
        state: state,
      );

  SolutionState getNextPageComments()
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        appUserId: appUserId,
        userName: userName,
        content: content,
        isUpvoted: isUpvoted,
        numberOfUpvotes: numberOfUpvotes,
        isDownvoted: isDownvoted,
        numberOfDownvotes: numberOfDownvotes,
        belongsToQuestionOfCurrentUser: belongsToQuestionOfCurrentUser,
        isOwner: isOwner,
        images: images,
        numberOfComments: numberOfComments,
        comments: comments.startLoadingNext(),
        state: state,
      );
  SolutionState addNextPageComments(Iterable<int> commentIds)
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        appUserId: appUserId,
        userName: userName,
        content: content,
        isUpvoted: isUpvoted,
        numberOfUpvotes: numberOfUpvotes,
        isDownvoted: isDownvoted,
        numberOfDownvotes: numberOfDownvotes,
        belongsToQuestionOfCurrentUser: belongsToQuestionOfCurrentUser,
        isOwner: isOwner,
        images: images,
        numberOfComments: numberOfComments,
        comments: comments.addNextPage(commentIds),
        state: state,
      );
  SolutionState addComment(int commentId)
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        appUserId: appUserId,
        userName: userName,
        content: content,
        isUpvoted: isUpvoted,
        numberOfUpvotes: numberOfUpvotes,
        isDownvoted: isDownvoted,
        numberOfDownvotes: numberOfDownvotes,
        belongsToQuestionOfCurrentUser: belongsToQuestionOfCurrentUser,
        isOwner: isOwner,
        images: images,
        numberOfComments: numberOfComments + 1,
        comments: comments.prependOne(commentId),
        state: state,
      );
  SolutionState removeComment(int commentId)
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        appUserId: appUserId,
        userName: userName,
        content: content,
        isUpvoted: isUpvoted,
        numberOfUpvotes: numberOfUpvotes,
        isDownvoted: isDownvoted,
        numberOfDownvotes: numberOfDownvotes,
        belongsToQuestionOfCurrentUser: belongsToQuestionOfCurrentUser,
        isOwner: isOwner,
        images: images,
        numberOfComments: numberOfComments - 1,
        comments: comments.removeOne(commentId),
        state: state,
      );

  SolutionState startLoadingImage(int index)
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        appUserId: appUserId,
        userName: userName,
        content: content,
        isUpvoted: isUpvoted,
        numberOfUpvotes: numberOfUpvotes,
        isDownvoted: isDownvoted,
        numberOfDownvotes: numberOfDownvotes,
        belongsToQuestionOfCurrentUser: belongsToQuestionOfCurrentUser,
        isOwner: isOwner,
        images: [...images.take(index),images.elementAt(index).startLoading(),...images.skip(index + 1)],
        numberOfComments: numberOfComments,
        comments: comments,
        state: state,
      );
  SolutionState loadImage(int index,Uint8List image)
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        appUserId: appUserId,
        userName: userName,
        content: content,
        isUpvoted: isUpvoted,
        numberOfUpvotes: numberOfUpvotes,
        isDownvoted: isDownvoted,
        numberOfDownvotes: numberOfDownvotes,
        belongsToQuestionOfCurrentUser: belongsToQuestionOfCurrentUser,
        isOwner: isOwner,
        images: [...images.take(index),images.elementAt(index).load(image),...images.skip(index + 1)],
        numberOfComments: numberOfComments,
        comments: comments,
        state: state,
      );

  SolutionState markAsCorrect()
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        appUserId: appUserId,
        userName: userName,
        content: content,
        isUpvoted: isUpvoted,
        numberOfUpvotes: numberOfUpvotes,
        isDownvoted: isDownvoted,
        numberOfDownvotes: numberOfDownvotes,
        belongsToQuestionOfCurrentUser: belongsToQuestionOfCurrentUser,
        isOwner: isOwner,
        images: images,
        numberOfComments: numberOfComments,
        comments: comments,
        state: SolutionStatus.correct
      );
  SolutionState markAsIncorrect()
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        appUserId: appUserId,
        userName: userName,
        content: content,
        isUpvoted: isUpvoted,
        numberOfUpvotes: numberOfUpvotes,
        isDownvoted: isDownvoted,
        numberOfDownvotes: numberOfDownvotes,
        belongsToQuestionOfCurrentUser: belongsToQuestionOfCurrentUser,
        isOwner: isOwner,
        images: images,
        numberOfComments: numberOfComments,
        comments: comments,
        state: SolutionStatus.incorrect
      );  

}