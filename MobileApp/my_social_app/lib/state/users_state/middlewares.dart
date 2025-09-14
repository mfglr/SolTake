import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/services/notification_hub.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/login_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/users_state/action.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

void loadUserByIdMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is LoadUserByIdAction){
    UserService()
      .getById(action.id)
      .then((user) => store.dispatch(LoadUserByIdSuccessAction(user: user.toUserState())))
      .catchError((e){
        if(e is BackendException){
          if(e.statusCode == 404){
            store.dispatch(UserNotFoundByIdAction(id: action.id));
          }
          else{
            store.dispatch(LoadUserByIdFailedAction(id: action.id));
          }
        }
        throw e;
      });
  }
  next(action);
}
void loadUserByUserNameMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is LoadUserByUserNameAction){
    UserService()
      .getByUserName(action.userName)
      .then((user) => store.dispatch(LoadUserByUserNameSuccessAction(user: user.toUserState())))
      .catchError((e){
        if(e is BackendException){
          if(e.statusCode == 404){
            store.dispatch(UserNotFoundByUserNameAction(userName: action.userName));
          }
          else{
            store.dispatch(LoadUserByUserNameFailedAction(userName: action.userName));
          }
        }
        throw e;
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
void updateUserBiographyMidleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UpdateUserBiographyAction){
    final accountId = store.state.login.login!.id;
    UserService()
      .updateBiography(action.biography)
      .then((_){
        store.dispatch(UpdateUserBiographySuccessAction(userId: accountId, biography: action.biography));
        ToastCreator.displaySuccess(biographyUpdatedNotificationContent[getLanguageByStore(store)]!);
      });
  }
  next(action);
}



