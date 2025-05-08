import 'package:my_social_app/services/ai_model_service.dart';
import 'package:my_social_app/state/app_state/ai_model_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

void getAllAIModelsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is GetAllAIModelsAction){
    AIModelService()
      .getAll()
      .then((models) => store.dispatch(GetAllAIModelsSuccessAction(aiModels: models.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const GetAllAIModelsFailedAction());
        throw e;
      });
  }
  next(action);
}