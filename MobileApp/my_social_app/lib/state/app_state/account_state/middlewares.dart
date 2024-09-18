import 'package:my_social_app/models/account.dart';
import 'package:my_social_app/services/account_service.dart';
import 'package:my_social_app/services/account_storage.dart';
import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/services/notification_hub.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';


void setAccount(Store<AppState> store,Account account){
  final state = account.toAccountState();
  AccountStorage().set(state);
  store.dispatch(ChangeAccessTokenAction(accessToken: account.accessToken));
  store.dispatch(UpdateAccountStateAction(payload: state));
}

void loginByPaswordMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoginByPasswordAction){
    final accountService = AccountService();
    accountService
      .loginByPassword(action.emailOrPassword, action.password)
      .then((account) => setAccount(store, account));
  }
  next(action);
}

void loginByFaceBookMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoginByFaceBookAction){
    final accountService = AccountService();
    accountService
      .loginByFaceBook(action.accessToken)
      .then((account) => setAccount(store, account));
  }
  next(action);
}

void confirmEmailMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is ConfirmEmailByTokenAction){
    final accountService = AccountService();
    accountService
      .confirmEmailByToken(action.token)
      .then((account) => setAccount(store, account));
  }
  next(action);
}

void createAccountMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateAccountAction){
    final accountService = AccountService();
    accountService
      .create(action.email, action.password, action.passwordConfirmation)
      .then((account) => setAccount(store, account));
  }
  next(action);
}

void logOutMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LogOutAction){
    AccountService()
      .logOut()
      .then((_){
        AccountStorage().remove();
        MessageHub().hubConnection.stop();
        NotificationHub().hubConnection.stop();
        store.dispatch(const ClearStateAction());
      });
  }
  next(action);
}