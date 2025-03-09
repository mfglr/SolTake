import 'package:my_social_app/services/solution_user_save_service.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_user_saves_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_user_saves_state/solution_user_save_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

void createSolutionUserSaveMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is CreateSolutionUserSaveAction){
    SolutionUserSaveService()
      .create(action.solutionId)
      .then((response){
        store.dispatch(CreateSolutinoUserSaveSuccessAction(solutionUserSave: SolutionUserSaveState(id: response.id, solutionId: action.solutionId)));
        store.dispatch(SaveSolutionAction(solutionId: action.solutionId));
      });
  }
  next(action);
}

void deleteSolutionUserSaveMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is DeleteSolutionUserSaveAction){
    SolutionUserSaveService()
      .delete(action.solutionId)
      .then((_){
        store.dispatch(DeleteSolutionUserSaveSuccessAction(solutionId: action.solutionId));
        store.dispatch(UnsaveSolutionAction(solutionId: action.solutionId));
      });
  }
  next(action);
}

void nextSolutionUserSavesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextSolutionUserSavesAction){
    SolutionUserSaveService()
      .get(store.state.solutionUserSaves.next)
      .then((solutionUserSaves){
        store.dispatch(NextSolutionUserSavesSuccessAction(solutionUserSaves: solutionUserSaves.map((e) => e.toSolutionUserSaveState())));
        store.dispatch(AddSolutionsAction(solutions: solutionUserSaves.map((e) => e.solution.toSolutionState())));
      })
      .catchError((e){
        store.dispatch(const NextSolutionUserSavesFailedAction());
        throw e;
      });
  }
  next(action);
}