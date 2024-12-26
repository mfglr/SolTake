import 'package:multimedia/models/multimedia_status.dart';
import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/helpers/get_language_code.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/shared/uploading_circle/uploading_file_status.dart';
import 'package:redux/redux.dart';

void updateCurrentUserImageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UpdateUserImageAction){
    UserService()
      .updateImage(
        action.file,
        (rate){ store.dispatch(ChangeUploadingUserImageRateAction(userId: action.userId, rate: rate)); }
      )
      .then((_) => action.file.file.readAsBytes())
      .then((image){
        store.dispatch(LoadUserImageSuccessAction(userId: action.userId, image: image));
        store.dispatch(ChangeProfileImageStatusAction(userId: action.userId,value: true));
        store.dispatch(ChangeUploadingUserImageStatusAction(userId: action.userId, status: UploadingFileStatus.success));
        ToastCreator.displaySuccess(userPhotoUpdatedNotificationContent[getLanguageCode(store)]!);
      })
      .catchError((e){
        store.dispatch(ChangeUploadingUserImageStatusAction(userId: action.userId, status: UploadingFileStatus.failed));
        throw e;
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
    if(userImageState.state == MultimediaStatus.started){//check this row
      UserService()
        .getImageById(action.userId)
        .then((image) => store.dispatch(LoadUserImageSuccessAction(userId: action.userId, image: image)));
    }
  }
  next(action);
}
