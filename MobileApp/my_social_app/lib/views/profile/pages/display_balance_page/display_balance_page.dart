import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/balance_state/actions.dart';
import 'package:my_social_app/state/balance_state/balance_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/transaction_state/actions.dart';
import 'package:my_social_app/state/transaction_state/selectors.dart';
import 'package:my_social_app/state/transaction_state/transaction_state.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/custom_packages/entity_state/pagination.dart';
import 'package:my_social_app/views/profile/pages/display_balance_page/widgets/add_funds/add_funds_button.dart';
import 'package:my_social_app/views/profile/pages/display_balance_page/widgets/transactions_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_back_button_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/loading_circle_widget.dart';

import 'display_balance_page_texts.dart';

class DisplayBalancePage extends StatefulWidget {
  const DisplayBalancePage({super.key});

  @override
  State<DisplayBalancePage> createState() => _DisplayBalancePageState();
}

class _DisplayBalancePageState extends State<DisplayBalancePage> {
  final ScrollController _scrollController = ScrollController();

  void _onScrollBottom() => onScrollBottom(
    _scrollController,
    (){
      final store = StoreProvider.of<AppState>(context, listen: false);
      getNextEntitiesIfReady(store, selectTransactionPagination(store), const NextTransactionsAction());
    }
  );

  @override
  void initState() {
    _scrollController.addListener(_onScrollBottom);
    super.initState();
  }


  @override
  void dispose() {
    _scrollController.removeListener(_onScrollBottom);
    _scrollController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(const LoadBalanceAction());
        store.dispatch(const FirstTransactionsAction());
        return store.onChange.map((state) => state.transactions).firstWhere((x) => !x.loadingNext);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: LanguageWidget(
            child: (language) => AppTitle(
              title: title[language]!
            )
          ),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: StoreConnector<AppState, (BalanceState, Pagination<int, TransactionState>)>(
            onInit: (store){
              store.dispatch(const LoadBalanceAction());
              getNextEntitiesIfNoPage(store, selectTransactionPagination(store), const NextTransactionsAction());
            },
            converter: (store) => (store.state.balance,selectTransactionPagination(store)),
            builder: (context, state) => Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                child: const FaIcon(
                                  FontAwesomeIcons.coins,
                                  color: Colors.amber,
                                  size: 40,
                                ),
                              ),
                              Text(
                                "${state.$1.balance} Sol",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          const AddFundsButton()
                        ],
                      ),
                    ),
                  ),
                  
                  Container(
                    margin: const EdgeInsets.only(top: 8,bottom: 8),
                    child: LanguageWidget(
                      child: (language) => Text(
                        transactionHistory[language]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                
                  Column(
                    children: [
                      TransactionsWidget(
                        transactions: state.$2.values,
                      ),
                      if(state.$2.loadingNext)
                        const LoadingCircleWidget()
                    ],
                  )
                
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}