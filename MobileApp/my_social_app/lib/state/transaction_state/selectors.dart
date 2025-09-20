
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/transaction_state/transaction_state.dart';
import 'package:my_social_app/custom_packages/entity_state/page.dart';
import 'package:my_social_app/custom_packages/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,TransactionState> selectTransactionPagination(Store<AppState> store) => store.state.transactions;
Page<int> selectNextTransactionsPage(Store<AppState> store) => store.state.transactions.next;