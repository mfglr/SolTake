import 'package:my_social_app/state/app_state/ai_model_state/actions.dart';
import 'package:my_social_app/state/app_state/ai_model_state/ai_model_state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,AIModelState> getAllReducer(Pagination<int,AIModelState> prev, GetAllAIModelsAction action)
  => prev.startLoadingNext();
Pagination<int,AIModelState> getAllSuccessReducer(Pagination<int, AIModelState> prev, GetAllAIModelsSuccessAction action)
  => prev.addNextPage(action.aiModels);
Pagination<int,AIModelState> getAllFailedReducer(Pagination<int, AIModelState> prev, GetAllAIModelsFailedAction action)
  => prev.stopLoadingNext();

Reducer<Pagination<int,AIModelState>> aiModelReducers = combineReducers([
  TypedReducer<Pagination<int,AIModelState>,GetAllAIModelsAction>(getAllReducer).call,
  TypedReducer<Pagination<int,AIModelState>,GetAllAIModelsSuccessAction>(getAllSuccessReducer).call,
  TypedReducer<Pagination<int,AIModelState>,GetAllAIModelsFailedAction>(getAllFailedReducer).call,
]);