import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/solution_entity_state/solution_state.dart';

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
class MarkSolutionAsApprovedAction extends redux.Action{
  final int solutionId;
  const MarkSolutionAsApprovedAction({required this.solutionId});
}
@immutable
class MarkSolutionAsApprovedSuccessAction extends redux.Action{
  final int solutionId;
  const MarkSolutionAsApprovedSuccessAction({required this.solutionId});
}

@immutable
class MarkSolutionAsPendingAction extends redux.Action{
  final int solutionId;
  const MarkSolutionAsPendingAction({required this.solutionId});
}
@immutable
class MarkSolutionAsPendingSuccessAction extends redux.Action{
  final int solutionId;
  const MarkSolutionAsPendingSuccessAction({required this.solutionId});
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