import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';

@immutable
class LoadSolutionAction extends redux.Action{
  final int solutionId;
  const LoadSolutionAction({required this.solutionId});
}

@immutable
class AddSolutionAction extends redux.Action{
  final SolutionState solution;
  const AddSolutionAction({required this.solution});
}
@immutable
class AddSolutionsAction extends redux.Action{
  final Iterable<SolutionState> solutions;
  const AddSolutionsAction({required this.solutions});
}
@immutable
class RemoveSolutionAction extends redux.Action{
  final SolutionState solution;
  const RemoveSolutionAction({required this.solution});
}
@immutable
class RemoveSolutionSuccessAction extends redux.Action{
  final int solutionId;
  const RemoveSolutionSuccessAction({required this.solutionId});
}

//upvotes
@immutable
class GetNextPageSolutionUpvotesIfNoPageAction extends redux.Action{
  final int solutionId;
  const GetNextPageSolutionUpvotesIfNoPageAction({required this.solutionId});
}
@immutable
class GetNextPageSolutionUpvotesIfReadyAction extends redux.Action{
  final int solutionId;
  const GetNextPageSolutionUpvotesIfReadyAction({required this.solutionId});
}
@immutable
class GetNextPageSolutionUpvotesAction extends redux.Action{
  final int solutionId;
  const GetNextPageSolutionUpvotesAction({required this.solutionId});
}
@immutable
class AddNextPageSolutionUpvatesAction extends redux.Action{
  final int solutionId;
  final Iterable<int> voteIds;
  const AddNextPageSolutionUpvatesAction({required this.solutionId, required this.voteIds});
}
@immutable
class MakeSolutionUpvoteAction extends redux.Action{
  final int solutionId;
  const MakeSolutionUpvoteAction({required this.solutionId});
}
@immutable
class MakeSolutionUpvoteSuccessAction extends redux.Action{
  final int solutionId;
  final int voteId;
  const MakeSolutionUpvoteSuccessAction({required this.solutionId,required this.voteId});
}
@immutable 
class RemoveSolutionUpvoteAction extends redux.Action{
  final int solutionId;
  const RemoveSolutionUpvoteAction({required this.solutionId});
}
@immutable
class RemoveSolutionUpvoteSuccessAction extends redux.Action{
  final int solutionId;
  final int voteId;
  const RemoveSolutionUpvoteSuccessAction({required this.solutionId,required this.voteId});
}

@immutable
class GetNextPageSolutionDownvotesIfNoPageAction extends redux.Action{
  final int solutionId;
  const GetNextPageSolutionDownvotesIfNoPageAction({required this.solutionId});
}
@immutable
class GetNextPageSolutionDownvotesIfReadyAction extends redux.Action{
  final int solutionId;
  const GetNextPageSolutionDownvotesIfReadyAction({required this.solutionId});
}
@immutable
class GetNextPageSolutionDownvotesAction extends redux.Action{
  final int solutionId;
  const GetNextPageSolutionDownvotesAction({required this.solutionId});
}
@immutable
class AddNextPageSolutionDownvotesAction extends redux.Action{
  final int solutionId;
  final Iterable<int> voteIds;
  const AddNextPageSolutionDownvotesAction({required this.solutionId, required this.voteIds});
}
@immutable
class MakeSolutionDownvoteAction extends redux.Action{
  final int solutionId;
  const MakeSolutionDownvoteAction({required this.solutionId});
}
@immutable
class MakeSolutionDownvoteSuccessAction extends redux.Action{
  final int solutionId;
  final int voteId;
  const MakeSolutionDownvoteSuccessAction({
    required this.solutionId,
    required this.voteId,
  });
}
@immutable
class RemoveSolutionDownvoteAction extends redux.Action{
  final int solutionId;
  const RemoveSolutionDownvoteAction({required this.solutionId});
}
@immutable
class RemoveSolutionDownvoteSuccessAction extends redux.Action{
  final int solutionId;
  final int voteId;
  const RemoveSolutionDownvoteSuccessAction({required this.solutionId,required this.voteId});
}


@immutable
class GetNextPageSolutionCommentsIfNoPageAction extends redux.Action{
  final int solutionId;
  const GetNextPageSolutionCommentsIfNoPageAction({required this.solutionId});
}
@immutable
class GetNextPageSolutionCommentsIfReadyAction extends redux.Action{
  final int solutionId;
  const GetNextPageSolutionCommentsIfReadyAction({required this.solutionId});
}
@immutable
class GetNextPageSolutionCommentsAction extends redux.Action{
  final int solutionId;
  const GetNextPageSolutionCommentsAction({required this.solutionId});
}
@immutable
class AddNextPageSolutionCommentsAction extends redux.Action{
  final int solutionId;
  final Iterable<int> commentsIds;
  const AddNextPageSolutionCommentsAction({required this.solutionId, required this.commentsIds});
}
@immutable
class AddSolutionCommentAction extends redux.Action{
  final int solutionId;
  final int commentId;
  const AddSolutionCommentAction({required this.solutionId, required this.commentId});
}
@immutable
class RemoveSolutionCommentAction extends redux.Action{
  final int solutionId;
  final int commentId;
  const RemoveSolutionCommentAction({required this.solutionId, required this.commentId});
}

@immutable
class LoadSolutionImageAction extends redux.Action{
  final int solutionId;
  final int index;
  const LoadSolutionImageAction({required this.solutionId, required this.index});
}
@immutable
class LoadSolutionImageSuccessAction extends redux.Action{
  final int solutionId;
  final int index;
  final Uint8List image;
  const LoadSolutionImageSuccessAction({required this.solutionId, required this.index, required this.image});
}

@immutable
class MarkSolutionAsCorrectAction extends redux.Action{
  final int questionId;
  final int solutionId;
  const MarkSolutionAsCorrectAction({required this.questionId,required this.solutionId,});
}
@immutable
class MarkSolutionAsCorrectSuccessAction extends redux.Action{
  final int solutionId;
  const MarkSolutionAsCorrectSuccessAction({required this.solutionId});
}
@immutable
class MarkSolutionAsIncorrectAction extends redux.Action{
  final int questionId;
  final int solutionId;
  const MarkSolutionAsIncorrectAction({required this.questionId, required this.solutionId});
}
@immutable
class MarkSolutionAsIncorrectSuccessAction extends redux.Action{
  final int solutionId;
  const MarkSolutionAsIncorrectSuccessAction({required this.solutionId});
}