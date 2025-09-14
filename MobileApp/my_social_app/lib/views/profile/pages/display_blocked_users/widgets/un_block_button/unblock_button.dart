import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_user_block_state/action.dart';
import 'package:my_social_app/state/user_user_block_state/user_user_block_state.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

import 'unblock_button_texts.dart';

class UnblockButton extends StatelessWidget {
  final UserUserBlockState userUserBlock;
  const UnblockButton({
    super.key,
    required this.userUserBlock
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(UnblockUserAction(userId: userUserBlock.userId));
      },
      child: LanguageWidget(
        child: (language) => Text(content[language]!)
      )
    );
  }
}