import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/search_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';

class RemoveSearchedUserButton extends StatelessWidget {
  final UserState user;
  const RemoveSearchedUserButton({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(RemoveSearchedUserAction(userId: user.id));
      },
      icon: const Icon(Icons.close)
    );
  }
}