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
import 'package:my_social_app/state/app_state/login_state/actions.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/active_account_page_state/actions.dart';
import 'package:my_social_app/state/app_state/active_account_page_state/active_account_page.dart';
import 'package:my_social_app/state/app_state/application_init_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

final _googleSignIn = GoogleSignIn();

void _setAccount(Store<AppState> store,Login login){
  final state = login.toLoginState();
  LoginStorage().set(state);
  AppClient().changeAccessToken(login.accessToken);
  MessageHub.init(login.accessToken, store);
  NotificationHub.init(login.accessToken, store);
  store.dispatch(UpdateLoginStateAction(payload: state));
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
        store.dispatch(const ChangeActiveAccountPageAction(activeAcountPage: ActiveAccountPage.registerPage));
        _setAccount(store, login);
      })
      .catchError((e){
        store.dispatch(const ChangeActiveAccountPageAction(activeAcountPage: ActiveAccountPage.registerPage));
        throw e;
      });
  }
  next(action);
}


void loginByRefreshTokenMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoginByRefreshToken){
    LoginStorage()
      .get()
      .then((prev){
        if(prev != null){
          UserService()
            .loginByRefreshtoken(prev.id, prev.refreshToken)
            .then((account){
              _setAccount(store, account);
              store.dispatch(const ApplicationSuccessfullyInitAction());
            })
            .catchError((error){
              if(!(error is BackendException && error.statusCode == 426)) _clearSession(store);
              store.dispatch(const ApplicationSuccessfullyInitAction());
              throw error;
            });
        }
        else{
          store.dispatch(const ApplicationSuccessfullyInitAction());
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
        store.dispatch(const ChangeActiveAccountPageAction(activeAcountPage: ActiveAccountPage.loginPage));
        _setAccount(store, account);
      })
      .catchError((e){
        store.dispatch(const ChangeActiveAccountPageAction(activeAcountPage: ActiveAccountPage.loginPage));
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
          store.dispatch(const ChangeActiveAccountPageAction(activeAcountPage: ActiveAccountPage.loginPage));
          _googleSignIn.disconnect();
          ToastCreator.displayError(unexceptionExceptionNotificationContents[getLanguageByStore(store)]!);
          return;
        }
        value.authentication
          .then((e){
            final accessToken = e.accessToken;
            if(accessToken == null){
              store.dispatch(const ChangeActiveAccountPageAction(activeAcountPage: ActiveAccountPage.loginPage));
              _googleSignIn.disconnect();
              ToastCreator.displayError(unexceptionExceptionNotificationContents[getLanguageByStore(store)]!);
              return;
            }
            UserService()
              .loginByGoogle(accessToken)
              .then((account){
                store.dispatch(const ChangeActiveAccountPageAction(activeAcountPage: ActiveAccountPage.loginPage));
                _setAccount(store, account);
              })
              .catchError((e){
                store.dispatch(const ChangeActiveAccountPageAction(activeAcountPage: ActiveAccountPage.loginPage));
                _googleSignIn.disconnect();
                throw e;
              });
          });
      })
      .catchError((e){
        store.dispatch(const ChangeActiveAccountPageAction(activeAcountPage: ActiveAccountPage.loginPage));
        _googleSignIn.disconnect();
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