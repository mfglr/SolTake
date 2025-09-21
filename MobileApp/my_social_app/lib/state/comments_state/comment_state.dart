import 'package:my_social_app/custom_packages/entity_state/entity.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/state/avatar.dart';

class CommentState extends Entity<int> implements Avatar{
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isOwner;
  final String userName;
  final int userId;
  final bool isEdited;
  final String content;
  final bool isLiked;
  final int numberOfLikes;
  final int numberOfChildren;
  final int? questionId;
  final int? solutionId;
  final int? parentId;
  final Media? image;

  @override
  int get avatarId => userId;
  @override
  Media? get avatar => image;

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
    required this.numberOfChildren,
    required this.questionId,
    required this.solutionId,
    required this.parentId,
    required this.image
  });

  String get formatContent => content.length > 20 ? "${content.substring(0,20)}..." : content;

  CommentState _optional({
    String? newUserName,
    bool? newIsEdited,
    String? newContent,
    bool? newIsLiked,
    int? newNumberOfLikes,
    int? newNumberOfChildren,
    Media? newImage,
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
      numberOfChildren: newNumberOfChildren ?? numberOfChildren,
      questionId: questionId,
      solutionId: solutionId,
      parentId: parentId,
      image: newImage ?? image
    );
  
  CommentState increaseNumberOfChildren() =>
    _optional(newNumberOfChildren: numberOfChildren + 1);
  CommentState decreaseNumberOfChildren() =>
    _optional(newNumberOfChildren: numberOfChildren - 1);
  
  CommentState like() =>
    _optional(
      newNumberOfLikes: numberOfLikes + 1,
      newIsLiked: true,
    );
  CommentState dislike() =>
    _optional(
      newNumberOfLikes: numberOfLikes - 1,
      newIsLiked: false
    );
}