import 'package:my_social_app/state/pagination.dart';

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
  final Iterable<int> images;
  final int numberOfComments;
  final Pagination comments;

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
    required this.comments
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
        comments: comments
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
        comments: comments
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
        comments: comments
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
        comments: comments
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
        comments: comments.startLoading()
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
        comments: comments.appendNextPage(commentIds)
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
        comments: comments.prependOne(commentId)
      );
}