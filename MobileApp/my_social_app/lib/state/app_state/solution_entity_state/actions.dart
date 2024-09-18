import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';


@immutable
class CreateSolutionAction extends AppAction{
  final int questionId;
  final String? content;
  final Iterable<XFile> images;
  const CreateSolutionAction({required this.questionId, required this.content, required this.images});
}

@immutable
class LoadSolutionAction extends AppAction{
  final int solutionId;
  const LoadSolutionAction({required this.solutionId});
}

@immutable
class AddSolutionAction extends AppAction{
  final SolutionState solution;
  const AddSolutionAction({required this.solution});
}
@immutable
class AddSolutionsAction extends AppAction{
  final Iterable<SolutionState> solutions;
  const AddSolutionsAction({required this.solutions});
}
@immutable
class RemoveSolutionAction extends AppAction{
  final SolutionState solution;
  const RemoveSolutionAction({required this.solution});
}
@immutable
class RemoveSolutionSuccessAction extends AppAction{
  final int solutionId;
  const RemoveSolutionSuccessAction({required this.solutionId});
}

//upvotes
@immutable
class GetNextPageSolutionUpvotesIfNoPageAction extends AppAction{
  final int solutionId;
  const GetNextPageSolutionUpvotesIfNoPageAction({required this.solutionId});
}
@immutable
class GetNextPageSolutionUpvotesIfReadyAction extends AppAction{
  final int solutionId;
  const GetNextPageSolutionUpvotesIfReadyAction({required this.solutionId});
}
@immutable
class GetNextPageSolutionUpvotesAction extends AppAction{
  final int solutionId;
  const GetNextPageSolutionUpvotesAction({required this.solutionId});
}
@immutable
class AddNextPageSolutionUpvatesAction extends AppAction{
  final int solutionId;
  final Iterable<int> voteIds;
  const AddNextPageSolutionUpvatesAction({required this.solutionId, required this.voteIds});
}
@immutable
class MakeSolutionUpvoteAction extends AppAction{
  final int solutionId;
  const MakeSolutionUpvoteAction({required this.solutionId});
}
@immutable
class MakeSolutionUpvoteSuccessAction extends AppAction{
  final int solutionId;
  final int upvoteId;
  final int downvoteId;

  const MakeSolutionUpvoteSuccessAction({
    required this.solutionId,
    required this.upvoteId,
    required this.downvoteId
  });
}
@immutable 
class RemoveSolutionUpvoteAction extends AppAction{
  final int solutionId;
  const RemoveSolutionUpvoteAction({required this.solutionId});
}
@immutable
class RemoveSolutionUpvoteSuccessAction extends AppAction{
  final int solutionId;
  final int voteId;
  const RemoveSolutionUpvoteSuccessAction({required this.solutionId,required this.voteId});
}
@immutable
class AddNewSolutionUpvoteAction extends AppAction{
  final int solutionId;
  final int voteId;
  const AddNewSolutionUpvoteAction({required this.solutionId, required this.voteId});
}


@immutable
class GetNextPageSolutionDownvotesIfNoPageAction extends AppAction{
  final int solutionId;
  const GetNextPageSolutionDownvotesIfNoPageAction({required this.solutionId});
}
@immutable
class GetNextPageSolutionDownvotesIfReadyAction extends AppAction{
  final int solutionId;
  const GetNextPageSolutionDownvotesIfReadyAction({required this.solutionId});
}
@immutable
class GetNextPageSolutionDownvotesAction extends AppAction{
  final int solutionId;
  const GetNextPageSolutionDownvotesAction({required this.solutionId});
}
@immutable
class AddNextPageSolutionDownvotesAction extends AppAction{
  final int solutionId;
  final Iterable<int> voteIds;
  const AddNextPageSolutionDownvotesAction({required this.solutionId, required this.voteIds});
}
@immutable
class MakeSolutionDownvoteAction extends AppAction{
  final int solutionId;
  const MakeSolutionDownvoteAction({required this.solutionId});
}
@immutable
class MakeSolutionDownvoteSuccessAction extends AppAction{
  final int solutionId;
  final int upvoteId;
  final int downvoteId;
  const MakeSolutionDownvoteSuccessAction({
    required this.solutionId,
    required this.upvoteId,
    required this.downvoteId
  });
}
@immutable
class RemoveSolutionDownvoteAction extends AppAction{
  final int solutionId;
  const RemoveSolutionDownvoteAction({required this.solutionId});
}
@immutable
class RemoveSolutionDownvoteSuccessAction extends AppAction{
  final int solutionId;
  final int voteId;
  const RemoveSolutionDownvoteSuccessAction({required this.solutionId,required this.voteId});
}
@immutable
class AddNewSolutionDownvoteAction extends AppAction{
  final int solutionId;
  final int voteId;
  const AddNewSolutionDownvoteAction({required this.solutionId, required this.voteId});
}

@immutable
class GetNextPageSolutionCommentsIfNoPageAction extends AppAction{
  final int solutionId;
  const GetNextPageSolutionCommentsIfNoPageAction({required this.solutionId});
}
@immutable
class GetNextPageSolutionCommentsIfReadyAction extends AppAction{
  final int solutionId;
  const GetNextPageSolutionCommentsIfReadyAction({required this.solutionId});
}
@immutable
class GetNextPageSolutionCommentsAction extends AppAction{
  final int solutionId;
  const GetNextPageSolutionCommentsAction({required this.solutionId});
}
@immutable
class AddNextPageSolutionCommentsAction extends AppAction{
  final int solutionId;
  final Iterable<int> commentsIds;
  const AddNextPageSolutionCommentsAction({required this.solutionId, required this.commentsIds});
}
@immutable
class AddSolutionCommentAction extends AppAction{
  final int solutionId;
  final int commentId;
  const AddSolutionCommentAction({required this.solutionId, required this.commentId});
}
@immutable
class RemoveSolutionCommentAction extends AppAction{
  final int solutionId;
  final int commentId;
  const RemoveSolutionCommentAction({required this.solutionId, required this.commentId});
}
@immutable
class AddNewSolutionCommentAction extends AppAction{
  final int solutionId;
  final int commentId;
  const AddNewSolutionCommentAction({required this.solutionId, required this.commentId});
}

@immutable
class LoadSolutionImageAction extends AppAction{
  final int solutionId;
  final int index;
  const LoadSolutionImageAction({required this.solutionId, required this.index});
}
@immutable
class LoadSolutionImageSuccessAction extends AppAction{
  final int solutionId;
  final int index;
  final Uint8List image;
  const LoadSolutionImageSuccessAction({required this.solutionId, required this.index, required this.image});
}

@immutable
class MarkSolutionAsCorrectAction extends AppAction{
  final int questionId;
  final int solutionId;
  const MarkSolutionAsCorrectAction({required this.questionId,required this.solutionId,});
}
@immutable
class MarkSolutionAsCorrectSuccessAction extends AppAction{
  final int solutionId;
  const MarkSolutionAsCorrectSuccessAction({required this.solutionId});
}
@immutable
class MarkSolutionAsIncorrectAction extends AppAction{
  final int questionId;
  final int solutionId;
  const MarkSolutionAsIncorrectAction({required this.questionId, required this.solutionId});
}
@immutable
class MarkSolutionAsIncorrectSuccessAction extends AppAction{
  final int solutionId;
  const MarkSolutionAsIncorrectSuccessAction({required this.solutionId});
}