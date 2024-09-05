import 'package:my_social_app/state/pagination/pagination.dart';

class CommentState{
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isOwner;
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
  final Pagination likes;
  final Pagination replies;
  final bool repliesVisibility;

  const CommentState({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isOwner,
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
  int get numberOfNotDisplayedReplies => numberOfReplies - (repliesVisibility ? replies.ids.length : 0);

  CommentState _optional({
    String? newUserName,
    bool? newIsEdited,
    String? newContent,
    bool? newIsLiked,
    int? newNumberOfLikes,
    int? newNumberOfReplies,
    Pagination? newLikes,
    Pagination? newReplies,
    bool? newRepliesVisibility
  }) => CommentState(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isOwner: isOwner,
      userName: newUserName ?? userName,
      appUserId: appUserId,
      isEdited: newIsEdited ?? isEdited,
      content: newContent ?? content,
      isLiked: newIsLiked ?? isLiked,
      numberOfLikes: newNumberOfLikes ?? numberOfLikes,
      numberOfReplies: newNumberOfReplies ?? numberOfReplies,
      questionId: questionId,
      solutionId: solutionId,
      parentId: parentId,
      likes: newLikes ?? likes,
      replies: newReplies ?? replies,
      repliesVisibility: newRepliesVisibility ?? repliesVisibility
    );

  CommentState getNextPageLikes()
    => _optional(newLikes: likes.startLoadingNext());
  CommentState addNextPageLikes(Iterable<int> ids)
    => _optional(newLikes: likes.addNextPage(ids));
  CommentState like(int likeId)
    => _optional(
        newNumberOfLikes: numberOfLikes + 1,
        newLikes: likes.prependOne(likeId),
        newIsLiked: true,
      );
  CommentState dislike(int likeId)
    => _optional(
        newNumberOfLikes: numberOfLikes - 1,
        newLikes: likes.removeOne(likeId),
        newIsLiked: false
      );
  CommentState addNewCommingLike(int likeId)
    => _optional(
        newNumberOfLikes: numberOfLikes + 1,
        newLikes: likes.addInOrder(likeId)
      );
 
  CommentState getNextPageReplies()
    => _optional(newReplies: replies.startLoadingNext());
  CommentState addNextPageReplies(Iterable<int> replyIds)
    => _optional(newReplies: replies.addNextPage(replyIds));
  CommentState addReply(int replyId)
    => _optional(
        newReplies: replies.prependOne(replyId),
        newNumberOfReplies: numberOfReplies + 1,
        newRepliesVisibility: true,
      );
  CommentState removeReply(int replyId)
    => _optional(
        newReplies: replies.removeOne(replyId),
        newNumberOfReplies: numberOfReplies - 1,
        newRepliesVisibility: true,
      );

  CommentState changeVisibility(bool visibility)
    => _optional(newRepliesVisibility: visibility);
}