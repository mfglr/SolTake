import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/loading_view.dart';
import 'package:my_social_app/views/shared/user/user_info_card_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {

    final userId = ModalRoute.of(context)!.settings.arguments as int;
    store.dispatch(LoadUserAction(userId: userId));
    
    return StoreConnector<AppState, UserState?>(
      converter: (store) => store.state.userEntityState.users[userId],
      builder: (context, userState){
        if(userState != null){
          return Scaffold(
            appBar: AppBar(
              title: Text(userState.formatUserName(10)),
            ),
            body: Container(
              padding: const EdgeInsets.all(5),
              child: UserInfoCardWidget(state: userState)
            )
          );
        }
        return const LoadingView();
      }
    );
  }
}