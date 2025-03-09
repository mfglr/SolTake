import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_user_saves_state/solution_user_save_state.dart';

@immutable
class SolutionUserSavesAction extends AppAction{
  const SolutionUserSavesAction();
}

@immutable
class CreateSolutionUserSaveAction extends SolutionUserSavesAction{
  final int solutionId;
  const CreateSolutionUserSaveAction({required this.solutionId});
}
@immutable
class CreateSolutinoUserSaveSuccessAction extends SolutionUserSavesAction{
  final SolutionUserSaveState solutionUserSave;
  const CreateSolutinoUserSaveSuccessAction({required this.solutionUserSave});
}

@immutable
class DeleteSolutionUserSaveAction extends SolutionUserSavesAction{
  final int solutionId;
  const DeleteSolutionUserSaveAction({required this.solutionId});
}
@immutable
class DeleteSolutionUserSaveSuccessAction extends SolutionUserSavesAction{
  final int solutionId;
  const DeleteSolutionUserSaveSuccessAction({required this.solutionId});
} 

@immutable
class NextSolutionUserSavesAction extends SolutionUserSavesAction{
  const NextSolutionUserSavesAction();
}
@immutable
class NextSolutionUserSavesSuccessAction extends SolutionUserSavesAction{
  final Iterable<SolutionUserSaveState> solutionUserSaves;
  const NextSolutionUserSavesSuccessAction({required this.solutionUserSaves});
}
@immutable
class NextSolutionUserSavesFailedAction extends SolutionUserSavesAction{
  const NextSolutionUserSavesFailedAction();
}