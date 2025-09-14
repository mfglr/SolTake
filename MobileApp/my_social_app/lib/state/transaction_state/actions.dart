import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/transaction_state/transaction_state.dart';

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

@immutable
class FirstTransactionsAction extends TransactionAction{
  const FirstTransactionsAction();
}
@immutable
class FirstTransactionsSuccessAction extends TransactionAction{
  final Iterable<TransactionState> transactions;
  const FirstTransactionsSuccessAction({required this.transactions});
}
@immutable
class FirstTransactionsFailedAction extends TransactionAction{
  const FirstTransactionsFailedAction();
}