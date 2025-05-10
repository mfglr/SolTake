
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/transaction_state/transaction_state.dart';
import 'package:my_social_app/state/entity_state/page.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,TransactionState> selectTransactionPagination(Store<AppState> store) => store.state.transactions;
Page<int> selectNextTransactionsPage(Store<AppState> store) => store.state.transactions.next;