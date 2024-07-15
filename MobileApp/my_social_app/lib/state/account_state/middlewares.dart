import 'package:my_social_app/services/account_service.dart';
import 'package:my_social_app/services/account_storage.dart';
import 'package:my_social_app/state/account_state/actions.dart';
import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

void loginByPasword(Store<AppState> store,action,NextDispatcher next){
  if(action is LoginByPasswordAction){
    final accountService = AccountService();
    final accountStorage = AccountStorage();
    accountService
      .loginByPassword(action.emailOrPassword, action.password)
      .then((account){
        final newAccountState = account.toAccountState();
        accountStorage.set(newAccountState);
        store.dispatch(ChangeAccessTokenAction(accessToken: account.accessToken));
        store.dispatch(UpdateAccountStateAction(payload: newAccountState));
      });
  }
  next(action);
}

void confirmEmailMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is ConfirmEmailByTokenAction){
    final accountService = AccountService();
    final accountStorage = AccountStorage();
    accountService
      .confirmEmailByToken(action.token)
      .then((account){
        final newAccountState = account.toAccountState();
        accountStorage.set(newAccountState);
        store.dispatch(ChangeAccessTokenAction(accessToken: account.accessToken));
        store.dispatch(UpdateAccountStateAction(payload: newAccountState));
      });
  }
  next(action);
}

void createAccountMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateAccountAction){
    final accountService = AccountService();
    final accountStorage = AccountStorage();
    accountService
      .create(action.email, action.password, action.passwordConfirmation)
      .then((account){
        final newAccountState = account.toAccountState();
        accountStorage.set(newAccountState);
        store.dispatch(ChangeAccessTokenAction(accessToken: account.accessToken));
        store.dispatch(UpdateAccountStateAction(payload: newAccountState));
      });
  }
  next(action);
}

void logOutMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LogOutAction){
    final accountService = AccountService();
    final accountStorage = AccountStorage();
    accountService
      .logOut()
      .then((_){
        accountStorage.remove();
        store.dispatch(const ChangeAccessTokenAction(accessToken: null));
        store.dispatch(const UpdateAccountStateAction(payload: null));
      });
  }
  next(action);
}