import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/services/notification_hub.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/app_state/login_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

void updateUserNameMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UpdateUserNameAction){
    UserService()
      .updateUserName(action.userName)
      .then((response){
        store.dispatch(UpdateUserNameSuccessAction(userId: store.state.login.login!.id, userName: action.userName));
        store.dispatch(UpdateRefreshTokenAction(refreshToken: response.refreshToken));
        AppClient().changeAccessToken(response.accessToken);
        MessageHub.init(response.accessToken, store);
        NotificationHub.init(response.accessToken, store);
        ToastCreator.displaySuccess(userNameUpdatedNotificationContent[getLanguageByStore(store)]!);
      });
  }
  next(action);
}
void updateNameMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UpdateNameAction){
    UserService()
      .updateName(action.name)
      .then((response){
        store.dispatch(UpdateNameSuccessAction(userId: store.state.login.login!.id, name: action.name));
        store.dispatch(UpdateRefreshTokenAction(refreshToken: response.refreshToken));
        AppClient().changeAccessToken(response.accessToken);
        MessageHub.init(response.accessToken, store);
        NotificationHub.init(response.accessToken, store);
        ToastCreator.displaySuccess(nameUpdatedNotificationContent[getLanguageByStore(store)]!);
      });
  }
  next(action);
}
void updateBiographyMidleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UpdateBiographyAction){
    final accountId = store.state.login.login!.id;
    UserService()
      .updateBiography(action.biography)
      .then((_){
        store.dispatch(UpdateBiographySuccessAction(userId: accountId, biography: action.biography));
        ToastCreator.displaySuccess(biographyUpdatedNotificationContent[getLanguageByStore(store)]!);
      });
  }
  next(action);
}
void uploadUserImageMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is UploadUserImageAction){
    UserService()
      .updateImage(
        action.image,
        action.userId,
        (rate) => store.dispatch(ChangeUserImageRateAction(userId: action.userId, rate: rate))
      )
      .then((response){
        store.dispatch(UploadUserImageSuccessAction(userId: action.userId, image: response.image));
        store.dispatch(UpdateRefreshTokenAction(refreshToken: response.refreshToken));
        AppClient().changeAccessToken(response.accessToken);
        MessageHub.init(response.accessToken, store);
        NotificationHub.init(response.accessToken, store);
      })
      .catchError((e){
        store.dispatch(UploadUserImageFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
void removeUserImageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RemoveUserImageAction){
    UserService()
      .removeImage(action.userId)
      .then((response){
        store.dispatch(RemoveUserImageSuccessAction(userId: action.userId));
        store.dispatch(UpdateRefreshTokenAction(refreshToken: response.refreshToken));
        AppClient().changeAccessToken(response.accessToken);
        MessageHub.init(response.accessToken, store);
        NotificationHub.init(response.accessToken, store);
      });
  }
  next(action);
}
