import 'package:my_social_app/services/access_token_provider.dart';
import 'package:my_social_app/services/account_service.dart';
import 'package:my_social_app/services/account_storage.dart';
import 'package:my_social_app/state/account_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

void loginByPasword(Store<AppState> store,action,NextDispatcher next){
  if(action is LoginByPasswordAction){
    final accountService = AccountService();
    final accountStorage = AccountStorage();
    final accessTokenProvier = AccessTokenProvider();
    accountService
      .loginByPassword(action.emailOrPassword, action.password)
      .then((account){
        accessTokenProvier.accessToken = account.accessToken;
        final newAccountState = account.toAccountState();
        accountStorage.set(newAccountState);
        store.dispatch(UpdateAccountStateAction(payload: newAccountState));
      });
  }
  next(action);
}

void confirmEmailMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is ConfirmEmailByTokenAction){
    final accountService = AccountService();
    final accountStorage = AccountStorage();
    final accessTokenProvier = AccessTokenProvider();
    accountService
      .confirmEmailByToken(action.token)
      .then((account){
        accessTokenProvier.accessToken = account.accessToken;
        final newAccountState = account.toAccountState();
        accountStorage.set(newAccountState);
        store.dispatch(UpdateAccountStateAction(payload: newAccountState));
      });
  }
  next(action);
}

void createAccountMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateAccountAction){
    final accountService = AccountService();
    final accountStorage = AccountStorage();
    final accessTokenProvier = AccessTokenProvider();
    accountService
      .create(action.email, action.password, action.passwordConfirmation)
      .then((account){
        accessTokenProvier.accessToken = account.accessToken;
        final newAccountState = account.toAccountState();
        accountStorage.set(newAccountState);
        store.dispatch(UpdateAccountStateAction(payload: newAccountState));
      });
  }
  next(action);
}

void logOutMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LogOutAction){
    final accountService = AccountService();
    final accountStorage = AccountStorage();
    final accessTokenProvier = AccessTokenProvider();
    accountService
      .logOut()
      .then((_){
        accessTokenProvier.accessToken = null;
        accountStorage.remove();
        store.dispatch(const UpdateAccountStateAction(payload: null));
      });
  }
  next(action);
}