import 'package:my_social_app/state/app_state/solution_user_save_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_user_save_entity_state/solution_user_save_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int,SolutionUserSaveState> addSavesReducer(EntityState<int,SolutionUserSaveState> prev, AddSolutionUserSavesAction action)
  => prev.appendMany(action.saves);
EntityState<int,SolutionUserSaveState> addSaveReducer(EntityState<int,SolutionUserSaveState> prev, AddSolutionUserSaveAction action)
  => prev.appendOne(action.save);
EntityState<int,SolutionUserSaveState> removeSaveReducer(EntityState<int,SolutionUserSaveState> prev,RemoveSolutionUserSaveAction action)
  => prev.removeOne(action.saveId);

Reducer<EntityState<int,SolutionUserSaveState>> solutionUserSaveEntityReducers = combineReducers<EntityState<int,SolutionUserSaveState>>([
  TypedReducer<EntityState<int,SolutionUserSaveState>,AddSolutionUserSavesAction>(addSavesReducer).call,
  TypedReducer<EntityState<int,SolutionUserSaveState>,AddSolutionUserSaveAction>(addSaveReducer).call,
  TypedReducer<EntityState<int,SolutionUserSaveState>,RemoveSolutionUserSaveAction>(removeSaveReducer).call,
]);