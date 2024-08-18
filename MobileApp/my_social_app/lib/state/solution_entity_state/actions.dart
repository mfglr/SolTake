import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/solution_entity_state/solution_state.dart';

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

//votes
@immutable
class MakeUpvoteAction extends redux.Action{
  final int solutionId;
  const MakeUpvoteAction({required this.solutionId});
}
@immutable
class MakeUpvoteSuccessAction extends redux.Action{
  final int solutionId;
  const MakeUpvoteSuccessAction({required this.solutionId});
}
@immutable
class MakeDownvoteAction extends redux.Action{
  final int solutionId;
  const MakeDownvoteAction({required this.solutionId});
}
@immutable
class MakeDownvoteSuccessAction extends redux.Action{
  final int solutionId;
  const MakeDownvoteSuccessAction({required this.solutionId});
}
@immutable 
class RemoveUpvoteAction extends redux.Action{
  final int solutionId;
  const RemoveUpvoteAction({required this.solutionId});
}
@immutable
class RemoveUpvoteSuccessAction extends redux.Action{
  final int solutionId;
  const RemoveUpvoteSuccessAction({required this.solutionId});
}
@immutable
class RemoveDownvoteAction extends redux.Action{
  final int solutionId;
  const RemoveDownvoteAction({required this.solutionId});
}
@immutable
class RemoveDownvoteSuccessAction extends redux.Action{
  final int solutionId;
  const RemoveDownvoteSuccessAction({required this.solutionId});
}

@immutable
class AddSolutionCommentAction extends redux.Action{
  final int solutionId;
  final int commentId;
  const AddSolutionCommentAction({required this.solutionId, required this.commentId});
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
class GetNextPageSolutionCommentsIfNoPageAction extends redux.Action{
  final int solutionId;
  const GetNextPageSolutionCommentsIfNoPageAction({required this.solutionId});
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