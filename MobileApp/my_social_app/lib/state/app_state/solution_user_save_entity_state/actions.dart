import 'package:flutter/foundation.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_user_save_entity_state/solution_user_save_state.dart';

@immutable
class AddSolutionUserSavesAction extends AppAction{
  final Iterable<SolutionUserSaveState> saves;
  const AddSolutionUserSavesAction({required this.saves});
}
@immutable
class AddSolutionUserSaveAction extends AppAction{
  final SolutionUserSaveState save;
  const AddSolutionUserSaveAction({required this.save});
}
@immutable
class RemoveSolutionUserSaveAction extends AppAction{
  final int saveId;
  const RemoveSolutionUserSaveAction({required this.saveId});
}