import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
part 'solution.g.dart';

@immutable
@JsonSerializable()
class Solution{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int questionId;
  final int userId;
  final bool isOwner;
  final bool isSaved;
  final String userName;
  final String? content;
  final bool isUpvoted;
  final int numberOfUpvotes;
  final bool isDownvoted;
  final int numberOfDownvotes;
  final Iterable<Multimedia> medias;
  final int numberOfComments;
  final int state;
  final bool doesBelongToQuestionOfCurrentUser;
  final Multimedia? image;
  final bool isCreatedByAI;
  final String? aiModelName;
  final Multimedia? aiImage;

  const Solution({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.questionId,
    required this.userId,
    required this.isOwner,
    required this.isSaved,
    required this.userName,
    required this.content,
    required this.isUpvoted,
    required this.numberOfUpvotes,
    required this.isDownvoted,
    required this.numberOfDownvotes,
    required this.medias,
    required this.numberOfComments,
    required this.state,
    required this.doesBelongToQuestionOfCurrentUser,
    required this.image,
    required this.isCreatedByAI,
    required this.aiModelName,
    required this.aiImage
  });

  factory Solution.fromJson(Map<String, dynamic> json) => _$SolutionFromJson(json);
  Map<String, dynamic> toJson() => _$SolutionToJson(this);

  SolutionState toSolutionState()
   => SolutionState(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      state: state,
      questionId: questionId,
      userId: userId,
      isOwner: isOwner,
      isSaved: isSaved,
      userName: userName,
      content: content,
      medias: medias.map((media) => media.toMedia()),
      numberOfComments: numberOfComments,
      doesBelongToQuestionOfCurrentUser: doesBelongToQuestionOfCurrentUser,
      isUpvoted: isUpvoted,
      numberOfUpvotes: numberOfUpvotes,
      image: image?.toMedia(),
      isCreatedByAI: isCreatedByAI,
      isDownvoted: isDownvoted,
      numberOfDownvotes: numberOfDownvotes,
      aiModelName: aiModelName,
      aiImage: aiImage?.toMedia()
    );
}