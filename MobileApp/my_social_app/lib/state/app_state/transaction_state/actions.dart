import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/transaction_state/transaction_state.dart';

@immutable
class TransactionAction extends AppAction{
  const TransactionAction();
}

@immutable
class NextTransactionsAction extends TransactionAction{
  const NextTransactionsAction();  
}
@immutable
class NextTransactionsSuccessAction extends TransactionAction{
  final Iterable<TransactionState> transactions;
  const NextTransactionsSuccessAction({required this.transactions});
}
@immutable
class NextTransactionsFailedAction extends TransactionAction{
  const NextTransactionsFailedAction();
}