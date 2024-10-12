import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/helpers/get_language_code.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/app_state/image_status.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

void updateCurrentUserImageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UpdateCurrentUserImageAction){
    final accountId = store.state.accountState!.id;
    UserService()
      .updateImage(action.file)
      .then((_)=> action.file.readAsBytes())
      .then((image){
        store.dispatch(LoadUserImageSuccessAction(userId: accountId, image: image));
        store.dispatch(ChangeProfileImageStatusAction(userId: accountId,value: true));
        ToastCreator.displaySuccess(userPhotoUpdatedNotificationContent[getLanguageCode(store)]!);
      });
  }
  next(action);
}
void removeCurrentUserImageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RemoveCurrentUserImageAction){
    final accountId = store.state.accountState!.id;
    UserService()
      .removeImage()
      .then((image){
        store.dispatch(LoadUserImageSuccessAction(userId: accountId, image: image));
        store.dispatch(ChangeProfileImageStatusAction(userId: accountId,value: false));
        ToastCreator.displaySuccess(userPhotoRemoveNotificationContent[getLanguageCode(store)]!);
      });
  }
  next(action);
}
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
