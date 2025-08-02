import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/state/entity_state/entity_collection/entity_state.dart';
import 'package:redux/redux.dart';


//following ************************************* following//

EntityState<int,UserState> updateUserNameReducer(EntityState<int,UserState> prev,UpdateUserNameSuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.updateUserName(action.userName));
EntityState<int,UserState> updateNameReducer(EntityState<int,UserState> prev, UpdateNameSuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.updateName(action.name));
EntityState<int,UserState> updateBiographyReducer(EntityState<int,UserState> prev, UpdateBiographySuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.updateBiography(action.biography));

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

  //followers
  TypedReducer<EntityState<int,UserState>,UpdateUserNameSuccessAction>(updateUserNameReducer).call,
  TypedReducer<EntityState<int,UserState>,UpdateNameSuccessAction>(updateNameReducer).call,
  TypedReducer<EntityState<int,UserState>,UpdateBiographySuccessAction>(updateBiographyReducer).call,

  TypedReducer<EntityState<int,UserState>,UploadUserImageAction>(uploadUserImageReducer).call,
  TypedReducer<EntityState<int,UserState>,UploadUserImageSuccessAction>(uploadUserImageSuccessReducer).call,
  TypedReducer<EntityState<int,UserState>,UploadUserImageFailedAction>(uploadUserImageFailedReducer).call,
  TypedReducer<EntityState<int,UserState>,RemoveUserImageSuccessAction>(remvoeUserImageReducer).call,
  TypedReducer<EntityState<int,UserState>,ChangeUserImageRateAction>(changeUserImageRateReducer).call,
]);