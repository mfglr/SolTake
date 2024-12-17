import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/helpers/get_language_code.dart';
import 'package:my_social_app/models/account.dart';
import 'package:my_social_app/services/account_service.dart';
import 'package:my_social_app/services/account_storage.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/active_account_page.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

final _googleSignIn = GoogleSignIn();

void _setAccount(Store<AppState> store,Account account){
  final state = account.toAccountState();
  AccountStorage().set(state);
  store.dispatch(ChangeAccessTokenAction(payload: account.accessToken));
  store.dispatch(ChangeAccountStateAction(payload: state));
}
void _clearSession(Store<AppState> store){
  AccountStorage().remove();
  _googleSignIn.disconnect();
  FacebookAuth.instance.logOut();
  store.dispatch(const ClearStateAction());
}

void createAccountMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateAccountAction){
    AccountService()
      .create(action.email, action.password, action.passwordConfirmation)
      .then((account){
        store.dispatch(const ChangeActiveAccountPageAction(payload: ActiveAccountPage.registerPage));
        _setAccount(store, account);
      })
      .catchError((e){
        store.dispatch(const ChangeActiveAccountPageAction(payload: ActiveAccountPage.registerPage));
        throw e;
      });
  }
  next(action);
}


void loginByRefreshTokenMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoginByRefreshToken){
    AccountStorage()
      .get()
      .then((prev){
        if(prev != null){
          AccountService()
            .loginByReshtoken(prev.id, prev.refreshToken)
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
    AccountService()
      .loginByPassword(action.emailOrPassword, action.password)
      .then((account){
        store.dispatch(const ChangeActiveAccountPageAction(payload: ActiveAccountPage.loginPage));
        _setAccount(store, account);
      })
      .catchError((e){
        store.dispatch(const ChangeActiveAccountPageAction(payload: ActiveAccountPage.loginPage));
        throw e;
      });
  }
  next(action);
}

void loginByFaceBookMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoginByFaceBookAction){
    FacebookAuth.instance
      .login()
      .then((value){
        FacebookAuth.instance.accessToken
          .then((value){
            if(value == null){
              store.dispatch(const ChangeActiveAccountPageAction(payload: ActiveAccountPage.loginPage));
              FacebookAuth.instance.logOut();
              ToastCreator.displayError(unexceptionExceptionNotificationContents[getLanguageCode(store)]!);
              return; 
            }
            AccountService()
              .loginByFaceBook(value.tokenString)
              .then((account){
                store.dispatch(const ChangeActiveAccountPageAction(payload: ActiveAccountPage.loginPage));
                _setAccount(store, account);
              })
              .catchError((e){
                store.dispatch(const ChangeActiveAccountPageAction(payload: ActiveAccountPage.loginPage));
                FacebookAuth.instance.logOut();
                throw e;
              });
          });
      })
      .catchError((e){
        store.dispatch(const ChangeActiveAccountPageAction(payload: ActiveAccountPage.loginPage));
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
          store.dispatch(const ChangeActiveAccountPageAction(payload: ActiveAccountPage.loginPage));
          _googleSignIn.disconnect();
          ToastCreator.displayError(unexceptionExceptionNotificationContents[getLanguageCode(store)]!);
          return;
        }
        value.authentication
          .then((e){
            final accessToken = e.accessToken;
            if(accessToken == null){
              store.dispatch(const ChangeActiveAccountPageAction(payload: ActiveAccountPage.loginPage));
              _googleSignIn.disconnect();
              ToastCreator.displayError(unexceptionExceptionNotificationContents[getLanguageCode(store)]!);
              return;
            }
            AccountService()
              .loginByGoogle(accessToken)
              .then((account){
                store.dispatch(const ChangeActiveAccountPageAction(payload: ActiveAccountPage.loginPage));
                _setAccount(store, account);
              })
              .catchError((e){
                store.dispatch(const ChangeActiveAccountPageAction(payload: ActiveAccountPage.loginPage));
                _googleSignIn.disconnect();
                throw e;
              });
          });
      })
      .catchError((e){
        store.dispatch(const ChangeActiveAccountPageAction(payload: ActiveAccountPage.loginPage));
        _googleSignIn.disconnect();
        throw e;
      });
  }
  next(action);
}

void confirmEmailMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is ConfirmEmailByTokenAction){
    AccountService()
      .verifyEmailByToken(action.token)
      .then((_) => store.dispatch(const ConfirmEmailByTokenSuccessAction()));
  }
  next(action);
}

void updateLanguageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UpdateLanguageAction){
    AccountService()
      .updateLanguage(action.language)
      .then((_) => store.dispatch(UpdateLanguageSuccessAction(language: action.language)));
  }
  next(action);
}

void deleteAccountMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is DeleteAccountAction){
    AccountService()
      .delete()
      .then((_) => _clearSession(store))
      .catchError((e){
        store.dispatch(const DeleteAccountFailedAction());
        throw e;
      });
  }
  next(action);
}

void approvePrivacyPolicyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is ApprovePrivacyPolicyAction){
    AccountService()
      .approvePolicy()
      .then((_) => store.dispatch(const ApprovePrivacyPolicySuccessAction()));
  }
  next(action);
}

void approveTersmOfUseMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is ApproveTermsOfUseAction){
    AccountService()
      .approveTermsOfUse()
      .then((_) => store.dispatch(const ApproveTermsOfUseSuccessAction()));
  }
  next(action);
}

void logOutMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LogOutAction){
    AccountService()
      .logOut()
      .then((_) => _clearSession(store));
  }
  next(action);
}