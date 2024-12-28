import 'package:my_social_app/state/app_state/upload_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_entity_state.dart';
import 'package:redux/redux.dart';

UploadEntityState changeUploadRateReducer(UploadEntityState prev,ChangeUploadRateAction action)
  => prev.changeRate(action.rate, action.id);
UploadEntityState changeUploadStatusReducer(UploadEntityState prev,ChangeUploadStatusAction action)
  => prev.changeStatus(action.status, action.id);
UploadEntityState addUploadStateReducer(UploadEntityState prev,AddUploadStateAction action)
  => prev.addState(action.state);

Reducer<UploadEntityState> uploadingEntityStateReducers = combineReducers<UploadEntityState>([
  TypedReducer<UploadEntityState,ChangeUploadRateAction>(changeUploadRateReducer).call,
  TypedReducer<UploadEntityState,ChangeUploadStatusAction>(changeUploadStatusReducer).call,
  TypedReducer<UploadEntityState,AddUploadStateAction>(addUploadStateReducer).call,
]);