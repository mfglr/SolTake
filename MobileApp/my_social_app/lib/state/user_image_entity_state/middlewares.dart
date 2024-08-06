import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/image_status.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_image_entity_state/actions.dart';
import 'package:redux/redux.dart';

void loadUserImageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadUserImageAction){
    final userImageState = store.state.userImageEntityState.entities[action.userId]!;
    if(userImageState.state == ImageStatus.notStarted){
      UserService()
        .getImageById(action.userId)
        .then((image) => store.dispatch(LoadUserImageSuccessAction(userId: action.userId, image: image)));
    }
  }
  next(action);
}
