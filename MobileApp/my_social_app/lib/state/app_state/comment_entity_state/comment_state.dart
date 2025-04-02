import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/avatar.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_user_like_state.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';

class CommentState extends BaseEntity<int> implements Avatar{
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isOwner;
  final String userName;
  final int userId;
  final bool isEdited;
  final String content;
  final bool isLiked;
  final int numberOfLikes;
  final int numberOfReplies;
  final int? questionId;
  final int? solutionId;
  final int? parentId;
  final Pagination<int,CommentUserLikeState> likes;
  final Pagination<int,Id<int>> children;
  final bool repliesVisibility;
  final Multimedia? image;

  @override
  int get avatarId => userId;
  @override
  Multimedia? get avatar => image;

  CommentState({
    required super.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isOwner,
    required this.userName,
    required this.userId,
    required this.isEdited,
    required this.content,
    required this.isLiked,
    required this.numberOfLikes,
    required this.numberOfReplies,
    required this.questionId,
    required this.solutionId,
    required this.parentId,
    required this.likes,
    required this.children,
    required this.repliesVisibility,
    required this.image
  });

  String get formatContent => content.length > 20 ? "${content.substring(0,20)}..." : content;
  int get numberOfNotDisplayedReplies => numberOfReplies - (repliesVisibility ? children.values.length : 0);

  CommentState _optional({
    String? newUserName,
    bool? newIsEdited,
    String? newContent,
    bool? newIsLiked,
    int? newNumberOfLikes,
    int? newNumberOfReplies,
    Pagination<int,CommentUserLikeState>? newLikes,
    Pagination<int,Id<int>>? newChildren,
    bool? newRepliesVisibility,
    Multimedia? newImage,
  }) => CommentState(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isOwner: isOwner,
      userName: newUserName ?? userName,
      userId: userId,
      isEdited: newIsEdited ?? isEdited,
      content: newContent ?? content,
      isLiked: newIsLiked ?? isLiked,
      numberOfLikes: newNumberOfLikes ?? numberOfLikes,
      numberOfReplies: newNumberOfReplies ?? numberOfReplies,
      questionId: questionId,
      solutionId: solutionId,
      parentId: parentId,
      likes: newLikes ?? likes,
      children: newChildren ?? children,
      repliesVisibility: newRepliesVisibility ?? repliesVisibility,
      image: newImage ?? image
    );

  CommentState startLoadingNextLikes()
    => _optional(newLikes: likes.startLoadingNext());
  CommentState stopLoadingNextLikes()
    => _optional(newLikes: likes.stopLoadingNext());
  CommentState addNextPageLikes(Iterable<CommentUserLikeState> commentUserLikes)
    => _optional(newLikes: likes.addNextPage(commentUserLikes));
  
  CommentState like(CommentUserLikeState commentUserLike) =>
    _optional(
      newNumberOfLikes: numberOfLikes + 1,
      newLikes: likes.prependOne(commentUserLike),
      newIsLiked: true,
    );
  CommentState dislike(int userId) =>
    _optional(
      newNumberOfLikes: numberOfLikes - 1,
      newLikes: likes.where((e) => e.userId != userId),
      newIsLiked: false
    );
  CommentState addNewLike(CommentUserLikeState commentUserLike) =>
    _optional(
      newNumberOfLikes: numberOfLikes + 1,
      newLikes: likes.addInOrder(commentUserLike)
    );
 
  CommentState startLoadingNextReplies() => _optional(newChildren: children.startLoadingNext());
  CommentState stopLoadingNextReplies() => _optional(newChildren: children.stopLoadingNext());
  CommentState addNextReplies(Iterable<int> replyIds) => _optional(newChildren: children.addNextPage(replyIds.map((e) => Id(id: e))));
  CommentState addReply(int replyId) =>
    _optional(
      newChildren: children.prependOne(Id(id: replyId)),
      newNumberOfReplies: numberOfReplies + 1,
      newRepliesVisibility: true,
    );
  CommentState removeReply(int replyId) =>
    _optional(
      newChildren: children.where((e) => e.id != replyId),
      newNumberOfReplies: numberOfReplies - 1,
      newRepliesVisibility: true,
    );
  CommentState addNewReply(int replyId) =>
    _optional(
      newChildren: children.addInOrder(Id(id: replyId)),
      newNumberOfReplies: numberOfReplies + 1,
      newRepliesVisibility: true,
    );

  CommentState changeVisibility(bool visibility) => _optional(newRepliesVisibility: visibility);
}