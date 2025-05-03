import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_social_app/state/app_state/balance_state/actions.dart';
import 'package:my_social_app/state/app_state/balance_state/balance_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/profile/pages/display_balance_page/widgets/add_funds/add_funds_button.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

import 'display_balance_page_texts.dart' show title;

class DisplayBalancePage extends StatelessWidget {
  const DisplayBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: LanguageWidget(
          child: (language) => AppTitle(
            title: title[language]!
          )
        ),
      ),
      body: StoreConnector<AppState, BalanceState>(
        onInit: (store) => store.dispatch(const LoadBalanceAction()),
        converter: (store) => store.state.balance,
        builder: (context, balance) => Container(
          margin: const EdgeInsets.all(8),
          child: Card(
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
                        "${balance.balance}\$",
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
        ),
      ),
    );
  }
}