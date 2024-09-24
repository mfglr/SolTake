import 'package:my_social_app/state/app_state/solution_user_save_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_user_save_entity_state/solution_user_save_entity_state.dart';
import 'package:redux/redux.dart';

SolutionUserSaveEntityState addSavesReducer(SolutionUserSaveEntityState prev, AddSolutionUserSavesAction action)
  => prev.addSaves(action.saves);
SolutionUserSaveEntityState addSaveReducer(SolutionUserSaveEntityState prev, AddSolutionUserSaveAction action)
  => prev.addSave(action.save);
SolutionUserSaveEntityState removeSaveReducer(SolutionUserSaveEntityState prev,RemoveSolutionUserSaveAction action)
  => prev.removeSave(action.saveId);

Reducer<SolutionUserSaveEntityState> solutionUserSaveEntityReducers = combineReducers<SolutionUserSaveEntityState>([
  TypedReducer<SolutionUserSaveEntityState,AddSolutionUserSavesAction>(addSavesReducer).call,
  TypedReducer<SolutionUserSaveEntityState,AddSolutionUserSaveAction>(addSaveReducer).call,
  TypedReducer<SolutionUserSaveEntityState,RemoveSolutionUserSaveAction>(removeSaveReducer).call,
]);