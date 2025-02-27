import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/models/avatar.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';

class CommentState extends BaseEntity<num> implements Avatar{
  final DateTime createdAt;
  final DateTime updatedAt;
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
  final Pagination<num,Id<num>> likes;
  final Pagination<num,Id<num>> replies;
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
    required this.replies,
    required this.repliesVisibility,
    required this.image
  });

  String get formatContent => content.length > 20 ? "${content.substring(0,20)}..." : content;
  int get numberOfNotDisplayedReplies => numberOfReplies - (repliesVisibility ? replies.values.length : 0);

  CommentState _optional({
    String? newUserName,
    bool? newIsEdited,
    String? newContent,
    bool? newIsLiked,
    int? newNumberOfLikes,
    int? newNumberOfReplies,
    Pagination<num,Id<num>>? newLikes,
    Pagination<num,Id<num>>? newReplies,
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
      replies: newReplies ?? replies,
      repliesVisibility: newRepliesVisibility ?? repliesVisibility,
      image: newImage ?? image
    );

  CommentState startLoadingNextLikes() => _optional(newLikes: likes.startLoadingNext());
  CommentState stopLoadingNextLikes() => _optional(newLikes: likes.stopLoadingNext());
  CommentState addNextPageLikes(Iterable<num> ids) => _optional(newLikes: likes.addNextPage(ids.map((e) => Id(id: e))));
  CommentState like(num likeId) =>
    _optional(
      newNumberOfLikes: numberOfLikes + 1,
      newLikes: likes.prependOne(Id(id: likeId)),
      newIsLiked: true,
    );
  CommentState dislike(num likeId) =>
    _optional(
      newNumberOfLikes: numberOfLikes - 1,
      newLikes: likes.where((e) => e.id != likeId),
      newIsLiked: false
    );
  CommentState addNewLike(num likeId) =>
    _optional(
      newNumberOfLikes: numberOfLikes + 1,
      newLikes: likes.addInOrder(Id(id: likeId))
    );
 
  CommentState startLoadingNextReplies() => _optional(newReplies: replies.startLoadingNext());
  CommentState stopLoadingNextReplies() => _optional(newReplies: replies.stopLoadingNext());
  CommentState addNextReplies(Iterable<num> replyIds) => _optional(newReplies: replies.addNextPage(replyIds.map((e) => Id(id: e))));
  CommentState addReply(num replyId) =>
    _optional(
      newReplies: replies.prependOne(Id(id: replyId)),
      newNumberOfReplies: numberOfReplies + 1,
      newRepliesVisibility: true,
    );
  CommentState removeReply(num replyId) =>
    _optional(
      newReplies: replies.where((e) => e.id != replyId),
      newNumberOfReplies: numberOfReplies - 1,
      newRepliesVisibility: true,
    );
  CommentState addNewReply(num replyId) =>
    _optional(
      newReplies: replies.addInOrder(Id(id: replyId)),
      newNumberOfReplies: numberOfReplies + 1,
      newRepliesVisibility: true,
    );

  CommentState changeVisibility(bool visibility) => _optional(newRepliesVisibility: visibility);
}