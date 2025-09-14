import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/models/login.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/services/login_storage.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/services/notification_hub.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/login_state/actions.dart';
import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

final _googleSignIn = Platform.isIOS 
  ? GoogleSignIn(
      clientId: dotenv.get('googleClientId')
    )
  : GoogleSignIn();

void _setAccount(Store<AppState> store,Login login){
  final state = login.toLoginState();
  LoginStorage().set(state);
  AppClient().changeAccessToken(login.accessToken);
  MessageHub.init(login.accessToken, store);
  NotificationHub.init(login.accessToken, store);
  store.dispatch(UpdateLoginStateAction(payload: state));
  UserService().removeRefreshTokens(login.refreshToken);
}
void _clearSession(Store<AppState> store){
  LoginStorage().remove();
  _googleSignIn.disconnect();
  MessageHub.close();
  NotificationHub.close();
  store.dispatch(const ClearStateAction());
}

void createUserMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateUserAction){
    UserService()
      .create(action.email, action.password, action.passwordConfirmation)
      .then((login){
        _setAccount(store, login);
        store.dispatch(LoginSuccessAction(payload: login.toLoginState()));
      })
      .catchError((e){
        throw e;
      });
  }
  next(action);
}

void loginByRefreshTokenMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoginByRefreshTokenAction){
    LoginStorage()
      .get()
      .then((prev){
        if(prev != null){
          UserService()
            .loginByRefreshtoken(prev.id, prev.refreshToken)
            .then((account){
              _setAccount(store, account);
              store.dispatch(LoginSuccessAction(payload: account.toLoginState()));
            })
            .catchError((error){
              if((error is BackendException && error.statusCode == 426)){
                _clearSession(store);
              }
              else{
                store.dispatch(const NotLoginAction());
              }
              throw error;
            });
        }
        else{
          store.dispatch(const NotLoginAction());
        }
      });
  }
  next(action);
}

void loginByPaswordMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoginByPasswordAction){
    UserService()
      .loginByPassword(action.emailOrPassword, action.password)
      .then((account){
        _setAccount(store, account);
        store.dispatch(LoginSuccessAction(payload: account.toLoginState()));
      })
      .catchError((e){
        store.dispatch(const NotLoginAction());
        throw e;
      });
  }
  next(action);
}

void loginByGoogleMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoginByGoogleAction){
    _googleSignIn
      .signIn()
      .then((value){
        if(value == null){
          _googleSignIn.disconnect();
          ToastCreator.displayError(unexceptionExceptionNotificationContents[getLanguageByStore(store)]!);
          store.dispatch(const NotLoginAction());
          return;
        }
        value.authentication
          .then((e){
            final accessToken = e.accessToken;
            if(accessToken == null){
              _googleSignIn.disconnect();
              ToastCreator.displayError(unexceptionExceptionNotificationContents[getLanguageByStore(store)]!);
              store.dispatch(const NotLoginAction());
              return;
            }
            UserService()
              .loginByGoogle(accessToken)
              .then((account){
                _setAccount(store, account);
                store.dispatch(LoginSuccessAction(payload: account.toLoginState()));
              })
              .catchError((e){
                _googleSignIn.disconnect();
                store.dispatch(const NotLoginAction());
                throw e;
              });
          });
      })
      .catchError((e){
        _googleSignIn.disconnect();
        store.dispatch(const NotLoginAction());
        throw e;
      });
  }
  next(action);
}

void confirmEmailMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is ConfirmEmailByTokenAction){
    UserService()
      .verifyEmail(action.token)
      .then((_) => store.dispatch(const ConfirmEmailByTokenSuccessAction()));
  }
  next(action);
}

void updateLanguageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UpdateLanguageAction){
    UserService()
      .updateLanguage(action.language)
      .then((_) => store.dispatch(UpdateLanguageSuccessAction(language: action.language)));
  }
  next(action);
}

void deleteUserMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is DeleteUserAction){
    UserService()
      .delete()
      .then((_) => _clearSession(store))
      .catchError((e){
        store.dispatch(const DeleteUserFailedAction());
        throw e;
      });
  }
  next(action);
}

void approvePrivacyPolicyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is ApprovePrivacyPolicyAction){
    UserService()
      .approvePolicy()
      .then((_) => store.dispatch(const ApprovePrivacyPolicySuccessAction()));
  }
  next(action);
}

void approveTersmOfUseMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is ApproveTermsOfUseAction){
    UserService()
      .approveTermsOfUse()
      .then((_) => store.dispatch(const ApproveTermsOfUseSuccessAction()));
  }
  next(action);
}

void logOutMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LogOutAction){
    UserService()
      .logOut()
      .then((_) => _clearSession(store));
  }
  next(action);
}