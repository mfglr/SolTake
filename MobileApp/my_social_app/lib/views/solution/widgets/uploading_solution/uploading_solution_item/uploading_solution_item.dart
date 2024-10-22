import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/account_state/account_state.dart';
import 'package:my_social_app/state/app_state/state.dart';

class UploadingSolutionItem extends StatelessWidget {
  const UploadingSolutionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: StoreConnector<AppState,AccountState>(
        converter: (store) => store.state.accountState!,
        builder: (context,account) => const Column(
          children: [
            Row(
              children: [

              ],
            )
          ],
        ),
      ),
    );
  }
}