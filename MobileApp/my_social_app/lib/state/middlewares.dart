import 'package:my_social_app/services/access_token_provider.dart';
import 'package:my_social_app/services/account_service.dart';
import 'package:my_social_app/services/account_storage.dart';
import 'package:my_social_app/state/account_state/actions.dart';
import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

void initAppMiddleware(Store<AppState> store,action,NextDispatcher next){
  final accountService = AccountService();
  final accountStorage = AccountStorage();
  final accessTokenProvier = AccessTokenProvider();
  if(action is InitAppAction){
    accountStorage
      .get()
      .then((oldAccuntState){
        if(oldAccuntState != null){
          accountService
            .loginByReshtoken(oldAccuntState.id, oldAccuntState.refreshToken)
            .then((account) {
              accessTokenProvier.accessToken = account.accessToken;
              final newAccountState = account.toAccountState();
              accountStorage.set(newAccountState);
              store.dispatch(UpdateAccountStateAction(payload: newAccountState));
              store.dispatch(const ApplicationSuccessfullyInitAction());
            })
            .catchError((error){
              store.dispatch(const UpdateAccountStateAction(payload: null));
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