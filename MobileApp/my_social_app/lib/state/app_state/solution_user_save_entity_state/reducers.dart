import 'package:my_social_app/state/app_state/solution_user_save_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_user_save_entity_state/solution_user_save_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<num,SolutionUserSaveState> addSavesReducer(EntityState<num,SolutionUserSaveState> prev, AddSolutionUserSavesAction action)
  => prev.appendMany(action.saves);
EntityState<num,SolutionUserSaveState> addSaveReducer(EntityState<num,SolutionUserSaveState> prev, AddSolutionUserSaveAction action)
  => prev.appendOne(action.save);
EntityState<num,SolutionUserSaveState> removeSaveReducer(EntityState<num,SolutionUserSaveState> prev,RemoveSolutionUserSaveAction action)
  => prev.removeOne(action.saveId);

Reducer<EntityState<num,SolutionUserSaveState>> solutionUserSaveEntityReducers = combineReducers<EntityState<num,SolutionUserSaveState>>([
  TypedReducer<EntityState<num,SolutionUserSaveState>,AddSolutionUserSavesAction>(addSavesReducer).call,
  TypedReducer<EntityState<num,SolutionUserSaveState>,AddSolutionUserSaveAction>(addSaveReducer).call,
  TypedReducer<EntityState<num,SolutionUserSaveState>,RemoveSolutionUserSaveAction>(removeSaveReducer).call,
]);