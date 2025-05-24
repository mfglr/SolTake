import 'package:my_social_app/services/balance_service.dart';
import 'package:my_social_app/state/app_state/balance_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

void loadBalanceMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is LoadBalanceAction){
    BalanceService()
      .getBalance(store.state.login.login!.id)
      .then((balance) => store.dispatch(LoadBalanceSuccessAction(balance: balance.toState())));
  }
  next(action);
}