import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_social_app/models/account.dart';
import 'package:my_social_app/services/account_service.dart';
import 'package:my_social_app/services/account_storage.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';


final _googleSignIn = GoogleSignIn();

void _setAccount(Store<AppState> store,Account account){
  final state = account.toAccountState();
  AccountStorage().set(state);
  store.dispatch(ChangeAccessTokenAction(accessToken: account.accessToken));
  store.dispatch(UpdateAccountStateAction(payload: state));
}
void _clearSession(Store<AppState> store){
  AccountStorage().remove();
  _googleSignIn.disconnect();
  FacebookAuth.instance.logOut();
  store.dispatch(const ClearStateAction());
}

void loginByRefreshTokenMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoginByRefreshToken){
    AccountStorage().get().then((oldAccuntState){
      if(oldAccuntState != null){
        AccountService()
          .loginByReshtoken(oldAccuntState.id, oldAccuntState.refreshToken)
          .then((newAccountState){
            _setAccount(store, newAccountState);
            store.dispatch(const ApplicationSuccessfullyInitAction());
          })
          .catchError((error){
            _clearSession(store);
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
      .then((account) => _setAccount(store, account));
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
            if(value == null) throw "Something went wrong.Please try again";
            AccountService()
              .loginByFaceBook(value.tokenString)
              .then((account) => _setAccount(store, account))
              .catchError((e){
                FacebookAuth.instance.logOut();
                throw e;
              });
          });
      });
  }
  next(action);
}

void loginByGoogleMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoginByGoogleAction){
    _googleSignIn
      .signIn()
      .then((value){
        if(value == null) throw "Something went wrong.Please try again";
        value.authentication
          .then((e){
            final accessToken = e.accessToken;
            if(accessToken == null) throw "Something went wrong.Please try again";
            AccountService()
              .loginByGoogle(accessToken)
              .then((account) => _setAccount(store, account))
              .catchError((e){
                _googleSignIn.disconnect();
                throw e;
              });
          });
      });
  }
  next(action);
}

void confirmEmailMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is ConfirmEmailByTokenAction){
    AccountService()
      .confirmEmailByToken(action.token)
      .then((account) => _setAccount(store, account));
  }
  next(action);
}

void createAccountMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateAccountAction){
    AccountService()
      .create(action.email, action.password, action.passwordConfirmation)
      .then((account) => _setAccount(store, account));
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