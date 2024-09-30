import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/models/solution_image.dart';
import 'package:my_social_app/state/pagination/pagination.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
part 'solution.g.dart';


@immutable
@JsonSerializable()
class Solution{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int questionId;
  final int appUserId;
  final bool isOwner;
  final bool isSaved;
  final bool hasVideo;
  final String userName;
  final String? content;
  final bool isUpvoted;
  final int numberOfUpvotes;
  final bool isDownvoted;
  final int numberOfDownvotes;
  final Iterable<SolutionImage> images;
  final int numberOfComments;
  final int state;

  const Solution({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.questionId,
    required this.appUserId,
    required this.isOwner,
    required this.isSaved,
    required this.hasVideo,
    required this.userName,
    required this.content,
    required this.isUpvoted,
    required this.numberOfUpvotes,
    required this.isDownvoted,
    required this.numberOfDownvotes,
    required this.images,
    required this.numberOfComments,
    required this.state
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
      appUserId: appUserId,
      isOwner: isOwner,
      isSaved: isSaved,
      hasVideo: hasVideo,
      userName: userName,
      content: content,
      images: images.map((e) => e.toSolutionImageState()),
      numberOfComments: numberOfComments,
      comments: Pagination.init(commentsPerPage,true),
      isUpvoted: isUpvoted,
      numberOfUpvotes: numberOfUpvotes,
      upvotes: Pagination.init(usersPerPage, true),
      isDownvoted: isDownvoted,
      numberOfDownvotes: numberOfDownvotes,
      downvotes: Pagination.init(usersPerPage,true)
    );
}