import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/transaction_state/transaction_state.dart';
import 'package:my_social_app/views/profile/pages/display_balance_page/widgets/transaction_widget/transaction_widget.dart';
import 'package:my_social_app/views/shared/app_column.dart';

class TransactionsWidget extends StatelessWidget {
  final Iterable<TransactionState> transactions;
  const TransactionsWidget({
    super.key,
    required this.transactions
  });

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      children: transactions.map((transaction) => TransactionWidget(transaction: transaction))
    );
  }
}