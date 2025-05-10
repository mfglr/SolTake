import 'package:my_social_app/services/transaction_service.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/transaction_state/actions.dart';
import 'package:my_social_app/state/app_state/transaction_state/selectors.dart';
import 'package:redux/redux.dart';

void nextTransactionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextTransactionsAction){
    TransactionService()
      .getByBalanceId(store.state.loginState!.id,selectNextTransactionsPage(store))
      .then((transactions) => store.dispatch(NextTransactionsSuccessAction(transactions: transactions.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const NextTransactionsFailedAction());
        throw e;
      });
  }
  next(action);
}