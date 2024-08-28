import 'package:my_social_app/state/app_state/comment_entity_state/comment_user_like_state.dart';
import 'package:my_social_app/state/pagination/id_state.dart';
import 'package:my_social_app/state/pagination/pagination.dart';

class CommentState{
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String userName;
  final int appUserId;
  final bool isEdited;
  final String content;
  final bool isLiked;
  final int numberOfLikes;
  final int numberOfReplies;
  final int? questionId;
  final int? solutionId;
  final int? parentId;
  final Pagination<num,CommentUserLikeState> likes;
  final Pagination<num,IdState> replies;
  final bool repliesVisibility;

  const CommentState({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userName,
    required this.appUserId,
    required this.isEdited,
    required this.content,
    required this.isLiked,
    required this.numberOfLikes,
    required this.numberOfReplies,
    required this.questionId,
    required this.solutionId,
    required this.parentId,
    required this.likes,
    required this.replies,
    required this.repliesVisibility,
  });

  String get formatContent => content.length > 20 ? "${content.substring(0,20)}..." : content;
  int get numberOfNotDisplayedReplies => numberOfReplies - (repliesVisibility ? replies.props.length : 0);

  CommentState getNextPageLikes()
    => CommentState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        userName: userName,
        appUserId: appUserId,
        isEdited: isEdited,
        content: content,
        isLiked: isLiked,
        numberOfLikes: numberOfLikes,
        numberOfReplies: numberOfReplies,
        questionId: questionId,
        solutionId: solutionId,
        parentId: parentId,
        likes: likes.startLoadingNext(),
        replies: replies,
        repliesVisibility: repliesVisibility,
      );
  CommentState addNextPageLikes(Iterable<CommentUserLikeState> likes)
    => CommentState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        userName: userName,
        appUserId: appUserId,
        isEdited: isEdited,
        content: content,
        isLiked: isLiked,
        numberOfLikes: numberOfLikes,
        numberOfReplies: numberOfReplies,
        questionId: questionId,
        solutionId: solutionId,
        parentId: parentId,
        likes: this.likes.addNextPage(likes),
        replies: replies,
        repliesVisibility: repliesVisibility,
      );
  CommentState like(CommentUserLikeState like)
    => CommentState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        appUserId: appUserId,
        userName: userName,
        questionId: questionId,
        isEdited: isEdited,
        content: content,
        numberOfLikes: numberOfLikes + 1,
        likes: likes.prependOne(like),
        isLiked: true,
        replies: replies,
        numberOfReplies: numberOfReplies,
        parentId: parentId,
        solutionId: solutionId,
        repliesVisibility: repliesVisibility,
      );
  CommentState dislike(int userId)
    => CommentState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        appUserId: appUserId,
        userName: userName,
        questionId: questionId,
        isEdited: isEdited,
        content: content,
        numberOfLikes: numberOfLikes - 1,
        likes: likes.where((like) => like.userId != userId),
        isLiked: false,
        replies: replies,
        numberOfReplies: numberOfReplies,
        parentId: parentId,
        solutionId: solutionId,
        repliesVisibility: repliesVisibility,
      );
 
  CommentState getNextPageReplies()
    => CommentState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        userName: userName,
        appUserId: appUserId,
        isEdited: isEdited,
        content: content,
        isLiked: isLiked,
        numberOfLikes: numberOfLikes,
        numberOfReplies: numberOfReplies,
        questionId: questionId,
        solutionId: solutionId,
        parentId: parentId,
        likes: likes,
        replies: replies.startLoadingNext(),
        repliesVisibility: repliesVisibility,
      );
  CommentState addNextPageReplies(Iterable<int> replyIds)
    => CommentState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        userName: userName,
        appUserId: appUserId,
        isEdited: isEdited,
        content: content,
        isLiked: isLiked,
        numberOfLikes: numberOfLikes,
        numberOfReplies: numberOfReplies,
        questionId: questionId,
        solutionId: solutionId,
        parentId: parentId,
        likes: likes,
        replies: replies.addNextPage(replyIds.map((replyId) => IdState(key: replyId))),
        repliesVisibility: repliesVisibility,
      );
  CommentState appendReply(int replyId)
    => CommentState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        appUserId: appUserId,
        userName: userName,
        questionId: questionId,
        isEdited: isEdited,
        content: content,
        numberOfLikes: numberOfLikes,
        likes: likes,
        isLiked: isLiked,
        replies: replies.appendOne(IdState(key: replyId)),
        numberOfReplies: numberOfReplies + 1,
        parentId: parentId,
        solutionId: solutionId,
        repliesVisibility: true,
      );
  CommentState removeReply(int replyId)
    => CommentState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        appUserId: appUserId,
        userName: userName,
        questionId: questionId,
        isEdited: isEdited,
        content: content,
        numberOfLikes: numberOfLikes,
        likes: likes,
        isLiked: isLiked,
        replies: replies.removeOne(IdState(key: replyId)),
        numberOfReplies: numberOfReplies - 1,
        parentId: parentId,
        solutionId: solutionId,
        repliesVisibility: true,
      );

  CommentState changeVisibility(bool visibility)
    => CommentState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        appUserId: appUserId,
        userName: userName,
        questionId: questionId,
        isEdited: isEdited,
        content: content,
        numberOfLikes: numberOfLikes,
        likes: likes,
        isLiked: isLiked,
        replies: replies,
        numberOfReplies: numberOfReplies,
        parentId: parentId,
        solutionId: solutionId,
        repliesVisibility: visibility,
      );
    
}