import 'package:my_social_app/state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/user_image_entity_state.dart';
import 'package:redux/redux.dart';

UserImageEntityState addUserImageReducer(UserImageEntityState prev,AddUserImageAction action)
  => prev.addValue(action.image);

UserImageEntityState addUserImagesReducer(UserImageEntityState prev,AddUserImagesAction action)
  => prev.addVaues(action.images);

UserImageEntityState loadUserImageSuccessReducer(UserImageEntityState prev,LoadUserImageSuccessAction action)
  => prev.load(action.userId, action.image);

Reducer<UserImageEntityState> userImageEntityStateReducers = combineReducers<UserImageEntityState>([
  TypedReducer<UserImageEntityState,AddUserImageAction>(addUserImageReducer).call,
  TypedReducer<UserImageEntityState,AddUserImagesAction>(addUserImagesReducer).call,
  TypedReducer<UserImageEntityState,LoadUserImageSuccessAction>(loadUserImageSuccessReducer).call,
]);