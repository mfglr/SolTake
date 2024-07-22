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