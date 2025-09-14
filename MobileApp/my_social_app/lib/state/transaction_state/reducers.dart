import 'package:my_social_app/state/transaction_state/actions.dart';
import 'package:my_social_app/state/transaction_state/transaction_state.dart';
import 'package:my_social_app/packages/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int, TransactionState> nextTransactionsReducer(Pagination<int, TransactionState> prev, NextTransactionsAction action)
  => prev.startLoadingNext();
Pagination<int, TransactionState> nextTransactionsSuccessReducer(Pagination<int, TransactionState> prev, NextTransactionsSuccessAction action)
  => prev.addNextPage(action.transactions);
Pagination<int, TransactionState> nextTransactionsFailedReducer(Pagination<int, TransactionState> prev, NextTransactionsFailedAction action)
  => prev.stopLoadingNext();

Pagination<int, TransactionState> firstTransactionsReducer(Pagination<int, TransactionState> prev, FirstTransactionsAction action)
  => prev.startLoadingNext();
Pagination<int, TransactionState> firstTransactionsSuccessReducer(Pagination<int, TransactionState> prev, FirstTransactionsSuccessAction action)
  => prev.refreshPage(action.transactions);
Pagination<int, TransactionState> firstTransactionsFailedReducer(Pagination<int, TransactionState> prev, FirstTransactionsFailedAction action)
  => prev.stopLoadingNext();


Reducer<Pagination<int, TransactionState>> transactionReducers = combineReducers([
  TypedReducer<Pagination<int,TransactionState>,NextTransactionsAction>(nextTransactionsReducer).call,
  TypedReducer<Pagination<int,TransactionState>,NextTransactionsSuccessAction>(nextTransactionsSuccessReducer).call,
  TypedReducer<Pagination<int,TransactionState>,NextTransactionsFailedAction>(nextTransactionsFailedReducer).call,
  
  TypedReducer<Pagination<int,TransactionState>,FirstTransactionsAction>(firstTransactionsReducer).call,
  TypedReducer<Pagination<int,TransactionState>,FirstTransactionsSuccessAction>(firstTransactionsSuccessReducer).call,
  TypedReducer<Pagination<int,TransactionState>,FirstTransactionsFailedAction>(firstTransactionsFailedReducer).call,
]);