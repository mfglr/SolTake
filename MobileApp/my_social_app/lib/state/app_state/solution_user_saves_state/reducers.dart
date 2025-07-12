import 'package:my_social_app/state/app_state/solution_user_saves_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_user_saves_state/solution_user_save_state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,SolutionUserSaveState> createSolutionUserSaveSuccessReducer(Pagination<int,SolutionUserSaveState> prev, CreateSolutinoUserSaveSuccessAction action)
  => prev.prependOne(action.solutionUserSave);
Pagination<int,SolutionUserSaveState> deleteSolutionUserSaveSuccessReducer(Pagination<int,SolutionUserSaveState> prev, DeleteSolutionUserSaveSuccessAction action)
  => prev.where((e) => e.solutionId != action.solutionId);

Pagination<int,SolutionUserSaveState> nextSolutionUserSavesReducer(Pagination<int,SolutionUserSaveState> prev, NextSolutionUserSavesAction action)
  => prev.startLoadingNext();
Pagination<int,SolutionUserSaveState> nextSolutionUserSavesSuccessReducer(Pagination<int,SolutionUserSaveState> prev, NextSolutionUserSavesSuccessAction action)
  => prev.addNextPage(action.solutionUserSaves);
Pagination<int,SolutionUserSaveState> nextSolutionUserSavesFailedReducer(Pagination<int,SolutionUserSaveState> prev, NextSolutionUserSavesFailedAction action)
  => prev.stopLoadingNext();
 
Reducer<Pagination<int,SolutionUserSaveState>> solutionUserSavesReducers = combineReducers([
  TypedReducer<Pagination<int,SolutionUserSaveState>,CreateSolutinoUserSaveSuccessAction>(createSolutionUserSaveSuccessReducer).call,
  TypedReducer<Pagination<int,SolutionUserSaveState>,DeleteSolutionUserSaveSuccessAction>(deleteSolutionUserSaveSuccessReducer).call,
  
  TypedReducer<Pagination<int,SolutionUserSaveState>,NextSolutionUserSavesAction>(nextSolutionUserSavesReducer).call,
  TypedReducer<Pagination<int,SolutionUserSaveState>,NextSolutionUserSavesSuccessAction>(nextSolutionUserSavesSuccessReducer).call,
  TypedReducer<Pagination<int,SolutionUserSaveState>,NextSolutionUserSavesFailedAction>(nextSolutionUserSavesFailedReducer).call,
]);