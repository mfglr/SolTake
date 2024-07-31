import 'package:my_social_app/services/account_service.dart';
import 'package:my_social_app/services/account_storage.dart';
import 'package:my_social_app/state/account_state/actions.dart';
import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

void initAppMiddleware(Store<AppState> store,action,NextDispatcher next){
  
  if(action is InitAppAction){

    final accountService = AccountService();
    final accountStorage = AccountStorage();

    accountStorage.get().then((oldAccuntState){
      if(oldAccuntState != null){
        accountService
          .loginByReshtoken(oldAccuntState.id, oldAccuntState.refreshToken)
          .then((account) {
            final newAccountState = account.toAccountState();
            accountStorage.set(newAccountState);
            store.dispatch(ChangeAccessTokenAction(accessToken: account.accessToken));
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
