import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/transaction_service.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/transaction_state/actions.dart';
import 'package:my_social_app/state/transaction_state/selectors.dart';
import 'package:my_social_app/custom_packages/entity_state/page.dart';
import 'package:redux/redux.dart';

void nextTransactionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextTransactionsAction){
    TransactionService()
      .getByBalanceId(store.state.login.login!.id,selectNextTransactionsPage(store))
      .then((transactions) => store.dispatch(NextTransactionsSuccessAction(transactions: transactions.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const NextTransactionsFailedAction());
        throw e;
      });
  }
  next(action);
}

void firstTransactionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is FirstTransactionsAction){
    TransactionService()
      .getByBalanceId(store.state.login.login!.id,Page.init(transactionsPerPage, true))
      .then((transactions) => store.dispatch(FirstTransactionsSuccessAction(transactions: transactions.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const FirstTransactionsFailedAction());
        throw e;
      });
  }
  next(action);
}