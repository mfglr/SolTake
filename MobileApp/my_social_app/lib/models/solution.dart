import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
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
    required this.aiModelName
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
      medias: medias,
      numberOfComments: numberOfComments,
      doesBelongToQuestionOfCurrentUser: doesBelongToQuestionOfCurrentUser,
      comments: Pagination.init(commentsPerPage,true),
      isUpvoted: isUpvoted,
      numberOfUpvotes: numberOfUpvotes,
      image: image,
      isCreatedByAI: isCreatedByAI,
      upvotes: Pagination.init(usersPerPage, true),
      isDownvoted: isDownvoted,
      numberOfDownvotes: numberOfDownvotes,
      downvotes: Pagination.init(usersPerPage,true),
      aiModelName: aiModelName
    );
}