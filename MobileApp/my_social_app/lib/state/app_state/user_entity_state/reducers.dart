import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/state/entity_state/entity_collection/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int,UserState> uploadUserImageReducer(EntityState<int,UserState> prev,UploadUserImageAction action)
  => prev.updateOne(prev.getValue(action.userId)!.uploadImage(action.image));
EntityState<int,UserState> uploadUserImageSuccessReducer(EntityState<int,UserState> prev, UploadUserImageSuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.uploadImageSuccess(action.image));
EntityState<int,UserState> uploadUserImageFailedReducer(EntityState<int,UserState> prev,UploadUserImageFailedAction action)
  => prev.updateOne(prev.getValue(action.userId)!.uploadImageFailed());
EntityState<int,UserState> remvoeUserImageReducer(EntityState<int,UserState> prev, RemoveUserImageSuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.removeImage());
EntityState<int,UserState> changeUserImageRateReducer(EntityState<int,UserState> prev, ChangeUserImageRateAction action)
  => prev.updateOne(prev.getValue(action.userId)!.changeRate(action.rate));


Reducer<EntityState<int,UserState>> userEntityStateReducers = combineReducers<EntityState<int,UserState>>([
  TypedReducer<EntityState<int,UserState>,UploadUserImageAction>(uploadUserImageReducer).call,
  TypedReducer<EntityState<int,UserState>,UploadUserImageSuccessAction>(uploadUserImageSuccessReducer).call,
  TypedReducer<EntityState<int,UserState>,UploadUserImageFailedAction>(uploadUserImageFailedReducer).call,
  TypedReducer<EntityState<int,UserState>,RemoveUserImageSuccessAction>(remvoeUserImageReducer).call,
  TypedReducer<EntityState<int,UserState>,ChangeUserImageRateAction>(changeUserImageRateReducer).call,
]);