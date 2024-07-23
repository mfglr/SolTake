import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/user_image_entity_state.dart';
import 'package:redux/redux.dart';

UserImageEntityState addUserImageReducer(UserImageEntityState prev,Action action)
  => action is AddUserImageAction ? prev.addValue(action.image) : prev;

UserImageEntityState addUserImagesReducer(UserImageEntityState prev,Action action)
  => action is AddUserImagesAction ? prev.addVaues(action.images) : prev;

UserImageEntityState loadUserImageSuccessReducer(UserImageEntityState prev,Action action)
  => action is LoadUserImageSuccessAction ? prev.load(action.userId, action.image) : prev;

Reducer<UserImageEntityState> userImageEntityStateReducers = combineReducers<UserImageEntityState>([
  TypedReducer<UserImageEntityState,AddUserImageAction>(addUserImageReducer).call,
  TypedReducer<UserImageEntityState,AddUserImagesAction>(addUserImagesReducer).call,
  TypedReducer<UserImageEntityState,LoadUserImageSuccessAction>(loadUserImageSuccessReducer).call,
]);